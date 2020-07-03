from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView
from django.views.generic.base import View

from .models import *


class CategoryList:
    """
    The lists of objects on similar or different pages
    1) get_category - Function which get list of "Category" objects on the pages
    """
    def get_category(self):
        return Category.objects.all()


class ProductListView(ListView, CategoryList):
    """
    List of Products in main page
    1) Should change the name of template on 'movie_list' cause class take the link of 'model' and after that
     autosubstitute ending of the word - '_list', after that he find the template with name 'product_list'
    2) CategoryList (get_category) - list of categories to header and sidebar
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


class CategoryDetailView(DetailView, CategoryList):
    """ List of product which have relationship with categories """
    model = Category
    template_name = 'shop/category_list.html'







