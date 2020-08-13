from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView
from django.views.generic.list import MultipleObjectMixin
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout

from .models.product import Product, Category, Subcategory, ProductType
from shop.business.filters import FiltersPropertyValuesList
from shop.business.producttype_filters_querysets.producttype_filters_json import JsonProductTypeFilterView
from shop.business.catalogue import CategoryList, SubcategoryList, ProductTypeList
from shop.forms.user_create_form import CreateUserForm


def register_page(request):
    """ Create the account by UserCreationForm, operation by forms, redirects and messages """
    form = CreateUserForm()

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request, 'Ваш аккаунт был успешно создан, ' + user + '!')
            return redirect('login')

    context = {'form': form}
    return render(request, 'account/register-page.html', context)


def login_page(request):
    """ Login into account, operation by forms, redirects and messages"""
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, 'Добро пожаловать ' + username + '!')
            return redirect('list')
        else:
            messages.info(request, 'Неверный логин, либо пароль :(')

    context = {}
    return render(request, 'account/login.html', context)


def logout_user(request):
    """ Logout actions """
    logout(request)
    return redirect('login')


class ProductListView(ListView, CategoryList):
    """
    List of Products in main page.
    CategoryList (get_category) - list of categories to header and sidebar.
    """
    model = Product
    queryset = Product.objects.filter(available=True)
    paginate_by = 40


class ProductDetailView(DetailView, CategoryList, FiltersPropertyValuesList):
    """
    1) Product card with tech, photo, buy, description info;
    2) CategoryList - list of categories to header;
    """
    model = Product
    slug_field = 'slug'


class CategoryDetailView(DetailView, MultipleObjectMixin, CategoryList, SubcategoryList):
    """ List of product which have relationship with categories. """
    model = Category
    paginate_by = 28

    def get_context_data(self, **kwargs):
        """
            Get list of products related to category in category-detail
            Use MultipleObjectMixin and have pagination just like in ListView
        """
        object_list = Product.objects.filter(categories__slug=self.kwargs.get('slug'))
        context = super(CategoryDetailView, self).get_context_data(object_list=object_list, **kwargs)
        return context


class SubcategoryDetailView(DetailView, MultipleObjectMixin, CategoryList, SubcategoryList, ProductTypeList):
    """ List of subcategory products which have relationship with categories. """
    model = Subcategory
    paginate_by = 28

    def get_context_data(self, **kwargs):
        """
            Get list of products related to subcategory in subcategory-detail
            Use MultipleObjectMixin and have pagination just like in ListView
        """
        object_list = Product.objects.filter(subcategories__slug=self.kwargs.get('slug'))
        context = super(SubcategoryDetailView, self).get_context_data(object_list=object_list, **kwargs)
        return context


class ProductTypeDetailView(DetailView, MultipleObjectMixin, CategoryList, ProductTypeList, FiltersPropertyValuesList):
    """ List of product-type products which have relationship with subcategories. """
    model = ProductType
    paginate_by = 28

    def get_context_data(self, **kwargs):
        """
            Get list of products related to product-type in ProductTypeDetail
            Use MultipleObjectMixin and have pagination just like in ListView
         """
        object_list = Product.objects.filter(product_type__slug=self.kwargs.get('slug'))
        context = super(ProductTypeDetailView, self).get_context_data(object_list=object_list, **kwargs)
        return context


class FilterProductsView(JsonProductTypeFilterView, CategoryList, ProductTypeList, FiltersPropertyValuesList, ListView):
    """
        After that when we gives view filters in product-type as FiltersPropertyValuesList, sort the products
        by filters in querysets by producttype_filters_querysets.
        Separate filters by product types is for easy manage filters
     """