from django.shortcuts import render, redirect
from django.http import request
from django.views.generic import ListView, DetailView
from django.views.generic.base import View

from .models.product import Product, Category, Subcategory, ProductType
from shop.business import CategoryList, SubcategoryList, ProductTypeList


class ProductListView(ListView, CategoryList):
    """
    List of Products in main page
    CategoryList (get_category) - list of categories to header and sidebar
    """
    model = Product
    queryset = Product.objects.filter(available=True)


class ProductDetailView(DetailView, CategoryList):
    """
    1) Product card with tech, photo, buy, description info
    2) CategoryList - list of categories to header
    """
    model = Product
    slug_field = 'slug'


class CategoryDetailView(DetailView, CategoryList, SubcategoryList):
    """ List of product which have relationship with categories """
    model = Category


class SubcategoryDetailView(DetailView, SubcategoryList, ProductTypeList):
    """ List of subcategory products which have relationship with categories """
    model = Subcategory


class ProductTypeDetailView(DetailView, ProductTypeList):
    """ List of product-type products which have relationship with subcategories """
    model = ProductType
