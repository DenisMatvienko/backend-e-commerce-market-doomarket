from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView
from django.views.generic.base import View

from .models import *


class CategorySubcategory:
    def get_category(self):
        """ Get list of category on main page filter """
        return Category.objects.all()

<<<<<<< HEAD
    def get_properties(self):
        product_object = Product.objects.all()
        for property in product_object:
            result = property.properties.all()
            return result

=======
>>>>>>> properties

class ProductListView(ListView, CategorySubcategory):
    """
    List of Products in main page
    1) Should change the name of template on 'movie_list' cause class take the link of 'model' and after that
     autosubstitute ending of the word - '_list', after that he find the template with name 'product_list'
    """
    model = Product
    queryset = Product.objects.filter(available=True)


class ProductDetailView(DetailView, CategorySubcategory):
    """ Product card with tech, photo, buy, description info"""
    model = Product
    slug_field = 'slug'





