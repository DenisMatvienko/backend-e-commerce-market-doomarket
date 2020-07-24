from .models.product import Product, Category, Subcategory, ProductType, Property, Value


class CategoryList:
    """
    The lists of category objects
    """
    def get_category(self):
        """ Get list categories on main page """
        return Category.objects.all()

    def get_product_by_category(self):
        """ Get list of products on each of category in category-detail """
        return Product.objects.filter(categories__slug=self.kwargs.get('slug'))


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

    def get_product_by_product_type(self):
        """ Return list of product-type products """
        return Product.objects.filter(product_type__slug=self.kwargs.get('slug'))


class FiltersPropertyValuesList:
    """ The lists on filter sidebar """

    def get_property(self):
        """ Return list of property into filters """
        return Property.objects.filter(product_type__slug=self.kwargs.get('slug'))[:6]

    def get_value(self):
        """ Return list of values into each property filter """
        return Value.objects.filter(properties__product_type__slug=self.kwargs.get('slug'))