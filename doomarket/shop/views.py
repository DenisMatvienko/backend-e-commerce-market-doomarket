from django.views.generic import ListView, DetailView
from django.views.generic.list import MultipleObjectMixin
from django.shortcuts import get_object_or_404

from .models.product import Product, Category, Subcategory, ProductType
from shop.business.filters import FiltersPropertyValuesList
from shop.business.producttype_filters_querysets.producttype_filters_json import JsonProductTypeFilterView
from shop.business.catalogue import CategoryList, SubcategoryList, ProductTypeList
from shop.business.accounts import AccountsView
from shop.business.recommender import Recommender
from cart.forms import CartAddProductForm


def register_page(request):
    """ Register logic by AccountsView """
    return AccountsView.register_page(request)


def login_page(request):
    """ Login logic by AccountsView """
    return AccountsView.login_page(request)


def logout_user(request):
    """ Logout logic by AccountsView """
    return AccountsView.logout_user(request)


class ProductListView(ListView, CategoryList):
    """
    List of Products in main page.
    CategoryList (get_category) - list of categories to header and sidebar.
    """
    model = Product
    queryset = Product.objects.filter(available=True)
    paginate_by = 30

    def get_context_data(self, **kwargs):
        """ Get form  'cart_product_form' in template """
        context = super(ProductListView, self).get_context_data(**kwargs)
        context['cart_product_form'] = CartAddProductForm()
        return context


class ProductDetailView(DetailView, CategoryList, FiltersPropertyValuesList):
    """
    1) Product card with tech, photo, buy, description info;
    2) CategoryList - list of categories to header;
    """
    model = Product
    slug_field = 'slug'

    def get_context_data(self, **kwargs):
        """ Get form  'cart_product_form' in template """
        context = super(ProductDetailView, self).get_context_data(**kwargs)
        context['cart_product_form'] = CartAddProductForm()
        r = Recommender()
        product = get_object_or_404(Product, id=3, available=True)
        context['recommended_products'] = r.suggest_products_for([product], 6)
        return context


class CategoryDetailView(DetailView, MultipleObjectMixin, CategoryList, SubcategoryList):
    """ List of product which have relationship with categories. """
    model = Category
    paginate_by = 30

    def get_context_data(self, **kwargs):
        """
            Get list of products related to category in category-detail
            Use MultipleObjectMixin and have pagination just like in ListView
            Get form  'cart_product_form' in template
        """
        object_list = Product.objects.filter(categories__slug=self.kwargs.get('slug'))
        context = super(CategoryDetailView, self).get_context_data(object_list=object_list, **kwargs)
        context['cart_product_form'] = CartAddProductForm()
        return context


class SubcategoryDetailView(DetailView, MultipleObjectMixin, CategoryList, SubcategoryList, ProductTypeList):
    """ List of subcategory products which have relationship with categories. """
    model = Subcategory
    paginate_by = 30

    def get_context_data(self, **kwargs):
        """
            Get list of products related to subcategory in subcategory-detail
            Use MultipleObjectMixin and have pagination just like in ListView
            Get form  'cart_product_form' in template
        """
        object_list = Product.objects.filter(subcategories__slug=self.kwargs.get('slug'))
        context = super(SubcategoryDetailView, self).get_context_data(object_list=object_list, **kwargs)
        context['cart_product_form'] = CartAddProductForm()
        return context


class ProductTypeDetailView(DetailView, MultipleObjectMixin, CategoryList, ProductTypeList, FiltersPropertyValuesList):
    """ List of product-type products which have relationship with subcategories. """
    model = ProductType
    paginate_by = 30

    def get_context_data(self, **kwargs):
        """
            Get list of products related to product-type in ProductTypeDetail
            Use MultipleObjectMixin and have pagination just like in ListView
            Get form  'cart_product_form' in template
         """
        object_list = Product.objects.filter(product_type__slug=self.kwargs.get('slug'))
        context = super(ProductTypeDetailView, self).get_context_data(object_list=object_list, **kwargs)
        context['cart_product_form'] = CartAddProductForm()
        return context


class FilterProductsView(JsonProductTypeFilterView, CategoryList, ProductTypeList, FiltersPropertyValuesList, ListView):
    """
        After that when we gives view filters in product-type as FiltersPropertyValuesList, sort the products
        by filters in querysets by producttype_filters_querysets.
        Separate filters by product types is for easy manage filters
     """


class Search(ListView, CategoryList):
    """ Products Search """
    paginate_by = 30

    def get_queryset(self):
        return Product.objects.filter(name__icontains=self.request.GET.get('q'))

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['q'] = f"q={self.request.GET.get('q')}&"
        return context