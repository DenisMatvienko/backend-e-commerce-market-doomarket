from django.shortcuts import render, redirect
from django.http import request
from django.views.generic import ListView, DetailView

from .models.product import Product, Category, Subcategory, ProductType
from shop.business.filters import FiltersPropertyValuesList
from shop.business.producttype_filters_querysets.producttype_filters import JsonProductTypeFilterView
from shop.business.catalogue import CategoryList, SubcategoryList, ProductTypeList


class ProductListView(ListView, CategoryList):
    """
    List of Products in main page.
    CategoryList (get_category) - list of categories to header and sidebar.
    """
    model = Product
    queryset = Product.objects.filter(available=True)


class ProductDetailView(DetailView, CategoryList, FiltersPropertyValuesList):
    """
    1) Product card with tech, photo, buy, description info;
    2) CategoryList - list of categories to header;
    """
    model = Product
    slug_field = 'slug'


class CategoryDetailView(DetailView, CategoryList, SubcategoryList):
    """ List of product which have relationship with categories. """
    model = Category


class SubcategoryDetailView(DetailView, CategoryList, SubcategoryList, ProductTypeList):
    """ List of subcategory products which have relationship with categories. """
    model = Subcategory


class ProductTypeDetailView(DetailView, CategoryList, ProductTypeList, FiltersPropertyValuesList):
    """ List of product-type products which have relationship with subcategories. """
    model = ProductType


class FilterProductsView(JsonProductTypeFilterView, CategoryList, ProductTypeList, FiltersPropertyValuesList, ListView):
    """
        After that when we gives view filters in product-type as FiltersPropertyValuesList, sort the products
        by filters in querysets by producttype_filters_querysets.
        Separate filters by product types is for easy manage filters
     """

