from django.contrib import admin
from .models.product import *
from modeltranslation.admin import TranslationAdmin
import csv
import datetime
from django.http import HttpResponse


admin.site.site_header = 'Doomarket admin'
admin.site.site_title = 'Doomarket admin'
admin.site.index_title = 'Welcome to Doomarket admin'


@admin.register(ProductType)
class ProductAdmin(TranslationAdmin):
    """ Product type fields in admin """
    list_display = ('name', 'subcategories', 'id',)
    list_display_links = ('name',)
    list_filter = ('subcategories',)
    search_fields = ('name',)
    readonly_fields = ('slug',)


@admin.register(Property)
class PropertyAdmin(TranslationAdmin):
    """ Properties fields in admin """
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'id',)
    readonly_fields = ('slug',)


@admin.register(ProductImg)
class ProductImgAdmin(admin.ModelAdmin):
    """ Img of products fields in admin """
    list_display = ('name', 'image', 'product',)
    list_display_links = ('name',)
    list_filter = ('name',)
    search_fields = ('name', 'product',)


@admin.register(Product)
class ProductAdmin(TranslationAdmin):
    """ Product fields in admin """
    list_display = ('name', 'brand', 'subcategories', 'updated', 'id',)
    list_display_links = ('name',)
    list_filter = ('brand', 'subcategories', 'updated', 'price',)
    search_fields = ('name', 'price',)
    readonly_fields = ('slug',)


@admin.register(Value)
class ProductInstancePropertyValueAdmin(TranslationAdmin):
    """ Value fields in admin """
    list_display = ('value', 'id',)


@admin.register(Brand, Collection)
class DisplaysAdmin(admin.ModelAdmin):
    """ Brand & Collections fields in admin """
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    readonly_fields = ('slug',)


@admin.register(Category)
class DisplaysAdmin(TranslationAdmin):
    """ Category fields in admin """
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    readonly_fields = ('slug',)


@admin.register(Subcategory)
class DisplaysAdmin(TranslationAdmin):
    """ Subcategory fields in admin """
    list_display = ('name', 'id',)
    list_display_links = ('name',)
    readonly_fields = ('slug',)
