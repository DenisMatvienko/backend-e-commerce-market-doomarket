from django.contrib import admin
from .models import *


@admin.register(Property)
class PropertyAdmin(admin.ModelAdmin):
    list_display = ('name', 'data', 'id',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'data', 'id',)
    readonly_fields = ('slug',)


@admin.register(ProductImg)
class ProductImgAdmin(admin.ModelAdmin):
    list_display = ('name', 'image', 'product',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'product',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'brand', 'subcategory', 'updated',)
    list_display_links = ('name',)
    list_filter = ('brand', 'subcategory', 'updated', 'price',)
    search_fields = ('name', 'price',)
    readonly_fields = ('slug',)


@admin.register(Category, Subcategory, Brand, Collection)
class DisplaysAdmin(admin.ModelAdmin):
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    readonly_fields = ('slug',)
