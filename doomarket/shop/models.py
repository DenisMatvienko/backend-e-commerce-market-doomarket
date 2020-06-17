from django.db import models
from django.utils.text import slugify
from transliterate import translit, get_available_language_codes
from time import time


def gen_slug(s):
    """
     Генерация слага из title (если title на русском, делается транслит), prepopulated_field не дает нужной
     уникальности по сравнению с этой функцией
     """
    transliterate_the = translit(s, 'ru', reversed=True)
    new_slug = slugify(transliterate_the)
    return new_slug + '' + str(int(time()))


class Category(models.Model):
    """Категории товаров"""
    name = models.CharField('Название категории', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'


class Subcategory(models.Model):
    """Подкатегории товаров"""
    name = models.CharField('Название подкатегории', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)
    category = models.ForeignKey(Category, verbose_name='', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Подкатегория'
        verbose_name_plural = 'Подкатегории'


class Brand(models.Model):
    """Бренды"""
    name = models.CharField('Название бренда', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Бренд'
        verbose_name_plural = 'Бренды'


class Collection(models.Model):
    """Коллекции"""
    name = models.CharField('Название коллекции', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Коллекция'
        verbose_name_plural = 'Коллекции'


class Product(models.Model):
    """Товары"""
    name = models.CharField('Название продукта', max_length=250, db_index=True)
    brand = models.ForeignKey(Brand, verbose_name='Бренд', on_delete=models.SET_NULL, null=True)
    collection = models.ForeignKey(Collection, verbose_name='Коллекция', on_delete=models.SET_NULL, null=True)
    slug = models.SlugField(max_length=50, unique=True, db_index=True)
    description = models.TextField('Описание')
    price = models.DecimalField('Цена', max_digits=10, decimal_places=2)
    available = models.BooleanField('Наличие товара', default=True)
    created = models.DateTimeField('Дата и время создания товара', auto_now_add=True)
    updated = models.DateTimeField('Дата и время последнего изменения', auto_now_add=True)
    title_img = models.ImageField('Изображение', upload_to='products/')
    category = models.ForeignKey(Category, verbose_name='Категория', on_delete=models.SET_NULL, null=True)
    subcategory = models.ForeignKey(Subcategory, verbose_name='Подкатегория', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ('-updated',)
        verbose_name = 'Продукт'
        verbose_name_plural = 'Продукты'
        indexes = [
            models.Index(fields=['id', 'slug']),
        ]

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)


class Property(models.Model):
    """Свойства товаров, технические характеристики"""
    product = models.ManyToManyField(Product, verbose_name='Продукт')
    name = models.CharField('Свойство', max_length=200, db_index=True)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    data = models.CharField('Значение', max_length=200, unique=True)
    slug = models.SlugField(max_length=50, unique=True, db_index=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Свойства'
        verbose_name_plural = 'Свойства'
        indexes = [
            models.Index(fields=['id', 'slug']),
        ]


class ProductImg(models.Model):
    """ Список из фотографий товара находящийся под основной фотографией в карточке """
    product = models.ForeignKey(Product, verbose_name='Продукт', on_delete=models.CASCADE)
    name = models.CharField('Заголовок', max_length=100)
    image = models.ImageField('Изображение', upload_to='product_img/')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Фотография товара'
        verbose_name_plural = 'Фотографии товара'
