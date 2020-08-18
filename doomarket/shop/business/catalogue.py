from shop.models.product import Product, Category, Subcategory, ProductType


class CategoryList:
    """
    The lists of category objects
    """
    def get_category(self):
        """ Get list categories on main page """
        return Category.objects.all()

    def get_product_recommendations(self):
        return Product.objects.all()[:7]


class SubcategoryList:
    """
        The lists of subcategory objects
    """
    def get_subcategory_by_category(self):
        """ Get list of subcategories on of each category in category-detail """
        return Subcategory.objects.filter(categories__slug=self.kwargs.get('slug'))

    def get_product_by_subcategory(self):
        """ Get list of products on of each subcategory in subcategory-detail """
        return Product.objects.filter(subcategories__slug=self.kwargs.get('slug'))


class ProductTypeList:
    """
        The lists of product-types objects
    """

    def get_product_type_by_subcategory(self):
        """ Return the product-type to subcategories list """
        return ProductType.objects.filter(subcategories__slug=self.kwargs.get('slug'))
