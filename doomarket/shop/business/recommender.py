import redis
from django.conf import settings
from shop.models.product import Product

connect = redis.StrictRedis(host=settings.REDIS_HOST,
                            port=settings.REDIS_PORT,
                            db=settings.REDIS_DB)


class Recommender(object):
    """
        Recommender - which realize save information about bought products and make recommendation for it,
         save & sort it
    """

    def get_product_key(self, id):
        """ Realize key product """
        return f'product:{id}:purchased_with'

    def product_bought(self, products):
        """
            Get list of objects which bought together
            1) For each product from list get ID, return list
            2) Loop each identifier from list and get products which bought with checked product
            3) Draw up Rredis-key by method 'get_product_key'.
            Note: for ID 33, method return 'product:{33}:purchased_with' - this storage key by which could get list
             of products bought with checked product
            4) Increasing the rating of each products from list, save information about that this products bought
             together
        """
        product_ids = [p.id for p in products]
        for product_id in product_ids:
            for with_id in product_ids:
                # Get products bought with checked product
                if product_id != with_id:
                    connect.zincrby(self.get_product_key(product_id), with_id, value=6)

    def suggest_products_for(self, products, max_result=6):
        """
            products - list of Product, which for need get recommendations
            max_result - int value, mean max count of recommendation products
            1) Get identifier suggested objects
            2) If first list of product which suggest as arg, contain 1 value - get list of products bought
             with em, considering rating - by Redis command (ZRANGE) limit result by (max_result=6)
            3) If in list (arg of func) we have more than 1 product, add temporary key of storage for Redis,
             using identifier of products
            4) Sum up ratings for each products, which bought, with some body products suggested in arg - by Redis
             command (ZUNIONSTORE)
            5) So that products which was suggested in func in list 'products' as not to get in recommendations -
            delete is by Redis command (ZREM)
            6) After that get identifier of products by temporary key - sorted by Redis command (ZRANGE). Restrict
             the result according to the variable max_result. Delete from storage temporary key
            7) Get Product-objects by identifier
        """
        product_ids = [p.id for p in products]
        if len(products) == 1:
            # Suggest 1 product
            suggetions = connect.zrange(self.get_product_key(product_ids[0]), 0, -1, desc=True)[:max_result]
        else:
            # Add temporary key of storage
            flat_ids = ''.join([str(id) for id in product_ids])
            tmp_key = f'tmp_{flat_ids}'
            # Save total sum of few products
            keys = [self.get_product_key(id) for id in product_ids]
            connect.zunionstore(tmp_key, keys)
            # Delete ID of product, which was transferred in list
            connect.zrem(tmp_key, *product_ids)
            # Get products sorted by rating
            suggetions = connect.zrange(tmp_key, 0, -1, desc=True)[:max_result]
            # Delete temporary key
            connect.delete(tmp_key)
        suggested_product_ids = [int(id) for id in suggetions]

        # Get recommendet products and sort it
        suggested_products = list(Product.objects.filter(id__in=suggested_product_ids))
        suggested_products.sort(key=lambda x: suggested_product_ids.index(x.id))
        return suggested_products

    def clear_purchases(self):
        """
            Clear method of recommendations
        """
        for id in Product.objects.values_list('id', flat=True):
            connect.delete(self.get_product_key(id))
