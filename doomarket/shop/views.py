from django.shortcuts import render, redirect
from django.views.generic import ListView, DetailView
from django.views.generic.base import View

from .models import *


def get_category():
    return Category.objects.all()


class ProductListView(ListView):
    """
    List of Products in main page
    1) Should change the name of template on 'movie_list' cause class take the link of 'model' and after that
     autosubstitute ending of the word - '_list', after that he find the template with name 'product_list'
    """
    model = Product
    queryset = Product.objects.filter(available=True)


class ProductDetailView(DetailView):
    """ Product card with tech, photo, buy, description info"""
    model = Product
    slug_field = 'slug'


class ProductCategoryView(ListView):
    model = Category
    queryset = Category.objects.all()






