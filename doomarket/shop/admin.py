from django.contrib import admin
from .models.product import *


admin.site.site_header = 'Doomarket admin'
admin.site.site_title = 'Doomarket admin'
admin.site.index_title = 'Welcome to Doomarket admin'


@admin.register(Property)
class PropertyAdmin(admin.ModelAdmin):
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'id',)
    readonly_fields = ('slug',)


@admin.register(ProductImg)
class ProductImgAdmin(admin.ModelAdmin):
    list_display = ('name', 'image', 'product',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'product',)


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'brand', 'subcategories', 'updated', 'id',)
    list_display_links = ('name',)
    list_filter = ('brand', 'subcategories', 'updated', 'price',)
    search_fields = ('name', 'price',)
    readonly_fields = ('slug',)


@admin.register(Value)
class ProductInstancePropertyValueAdmin(admin.ModelAdmin):
    list_display = ('value',)


@admin.register(Category, Subcategory, Brand, Collection, ProductType)
class DisplaysAdmin(admin.ModelAdmin):
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    readonly_fields = ('slug',)
