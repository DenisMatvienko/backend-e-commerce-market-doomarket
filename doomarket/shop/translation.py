from modeltranslation.translator import register, TranslationOptions
from shop.models.product import Category, Subcategory, ProductType, Product, Property, Value


@register(Category)
class CategoryTranslationOptions(TranslationOptions):
    fields = ('name', 'alias',)


@register(Subcategory)
class SubcategoryTranslationOptions(TranslationOptions):
    fields = ('name', 'alias',)


@register(ProductType)
class ProductTypeTranslationOptions(TranslationOptions):
    fields = ('name', 'alias',)


@register(Product)
class ProductTranslationOptions(TranslationOptions):
    fields = ('name', 'description',)


@register(Property)
class PropertyTranslationOptions(TranslationOptions):
    fields = ('name', 'alias',)


@register(Value)
class ValueTranslationOptions(TranslationOptions):
    fields = ('value',)
