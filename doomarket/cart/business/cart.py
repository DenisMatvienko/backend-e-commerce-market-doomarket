from decimal import Decimal
from django.conf import settings
from shop.models.product import Product


class Cart:
    def __init__(self, request):
        """ Initialization cart object  """
        self.session = request.session
        cart = self.session.get(settings.CART_SESSION_ID)
        if not cart:
            # Save empty cart
            cart = self.session[settings.CART_SESSION_ID] = {}
        self.cart = cart

    def add(self, product, quantity=1, update_quantity=False):
        """
            Add products into cart or reload quantity
            Str - cause django use json for serialize, but json format as key can use just str
        """
        product_id = str(product.id)
        if product_id not in self.cart:
            self.cart[product_id] = {'quantity': 0, 'price': str(product.price)}
        if update_quantity:
            self.cart[product_id]['quantity'] = quantity
        else:
            self.cart[product_id]['quantity'] += quantity
        self.save()

    def save(self):
        """ Make session as changed """
        self.session.modified = True

    def remove(self, product):
        """ Remove product from the cart """
        product_id = str(product.id)
        if product_id in self.cart:
            del self.cart[product_id]
            self.save()

    def __iter__(self):
        """
            For viewing list of product added to cart- we need iterate by all product's object's
             We are iterating goods added into cart and get product objects
        """
        product_ids = self.cart.keys()
        # Get objects of Product - model and get it into cart
        products = Product.objects.filter(id__in=product_ids)

        cart = self.cart.copy()
        for product in products:
            cart[str(product.id)]['product'] = product
        for item in cart.values():
            item['price'] = Decimal(item['price'])
            item['total_price'] = item['price'] * item['quantity']
            yield item

    def __len__(self):
        """ Get total quantity products in cart """
        return sum(item['quantity'] for item in self.cart.values())

    def get_total_price(self):
        """ Get count of total price of all products in cart """
        return sum(
            Decimal(item['price']) * item['quantity']
            for item in self.cart.values()
        )

    def clear(self):
        """ Clear the cart """
        del self.session[settings.CART_SESSION_ID]
        self.save()