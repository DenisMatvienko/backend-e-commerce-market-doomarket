from .models import Product, Category, Subcategory, Basis


class CategoryList:
    """
    The lists of objects on similar or different pages
    """
    def get_category(self):
        """ Get list categories on main page """
        return Category.objects.all()

    def get_product_by_category(self):
        """ Get list of products on each of category in category-detail """
        return Product.objects.filter(categories__slug=self.kwargs.get('slug'))

    def get_subcategory_by_category(self):
        """ Get list of subcategories on of each category in category-detail """
        return Subcategory.objects.filter(categories__slug=self.kwargs.get('slug'))

    def get_product_by_subcategory(self):
        """ Get list of products on of each subcategory in subcategory-detail """
        return Product.objects.filter(subcategories__slug=self.kwargs.get('slug'))

    def get_basis_by_subcategory(self):

        return Basis.objects.filter(subcategories__slug=self.kwargs.get('slug'))

    def get_product_by_basis(self):

        return Product.objects.filter(basis__slug=self.kwargs.get('slug'))