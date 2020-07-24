from django.db import models
from django.urls import reverse
from shop.utils import gen_slug, gen_slug_clear


class Category(models.Model):
    """ Category of products """
    name = models.CharField('Название категории', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)
    icon_field = models.ImageField('Изображение', blank=True, null=True, upload_to='category_icon/')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        """ Get 'name' to generate slug which calls transliterate -'name' """
        if not self.id:
            self.slug = gen_slug_clear(self.name)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('product-category', kwargs={'slug': self.slug})

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'


class Subcategory(models.Model):
    """ Subcategory of products """
    name = models.CharField('Название подкатегории', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)
    categories = models.ForeignKey(Category, verbose_name='Категория', on_delete=models.SET_NULL, null=True)
    icon_field = models.ImageField('Изображение', blank=True, null=True, upload_to='subcategory_icon/')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug_clear(self.name)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('product-subcategory', kwargs={'slug': self.slug})

    class Meta:
        verbose_name = 'Подкатегория'
        verbose_name_plural = 'Подкатегории'


class Brand(models.Model):
    """ Brands """
    name = models.CharField('Название бренда', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)
    icon_field = models.ImageField('Изображение', blank=True, null=True, upload_to='brand_icon/')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug_clear(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Бренд'
        verbose_name_plural = 'Бренды'


class Collection(models.Model):
    """ Collections """
    name = models.CharField('Название коллекции', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug_clear(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Коллекция'
        verbose_name_plural = 'Коллекции'


class ProductType(models.Model):
    """
        ProductType (of products which have same tec info and properties, as group of same products in ProductType)
        That decision made of EAV model, actually  easy to use*, than get property separate to each product.
        In this decision you can get the list of properties to basis and this list of properties will be displayed in
        group of products which is includet to ProductType object.
        Also this decisions uses to large markets which have big nomenclature, and different association with naming
        of categories
        *Easy to use - is when you assign some properties to group of products, instead assign properties to every
         product
    """
    name = models.CharField('Название основы', max_length=250)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True)
    subcategories = models.ForeignKey(Subcategory, verbose_name='Подкатегория', on_delete=models.SET_NULL, null=True)
    icon_field = models.ImageField('Изображение', blank=True, null=True, upload_to='basis_icon/')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug_clear(self.name)
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('product-type', kwargs={'slug': self.slug})

    class Meta:
        verbose_name = 'Основа'
        verbose_name_plural = 'Основы'


class Product(models.Model):
    """ Products in catalogue """
    name = models.CharField('Название продукта', max_length=250, db_index=True)
    brand = models.ForeignKey(
        Brand,
        verbose_name='Бренд',
        on_delete=models.SET_NULL,
        null=True,
        related_name='brands'
    )
    collection = models.ForeignKey(
        Collection,
        verbose_name='Коллекция',
        on_delete=models.SET_NULL,
        null=True,
        related_name='collections'
    )
    article = models.CharField('Артикул', max_length=250, db_index=True)
    slug = models.SlugField(max_length=50, unique=True, db_index=True)
    description = models.TextField('Описание')
    price = models.DecimalField('Цена', max_digits=10, decimal_places=2)
    available = models.BooleanField('Наличие товара', default=True)
    created = models.DateTimeField('Дата и время создания товара', auto_now_add=True)
    updated = models.DateTimeField('Дата и время последнего изменения', auto_now_add=True)
    title_img = models.ImageField('Изображение', upload_to='products/')
    categories = models.ForeignKey(
        Category,
        verbose_name='Категория',
        on_delete=models.SET_NULL,
        null=True,
        related_name='categorys'
    )
    subcategories = models.ForeignKey(
        Subcategory,
        verbose_name='Подкатегория',
        on_delete=models.SET_NULL,
        null=True,
        related_name='subcategorys'
    )
    product_type = models.ForeignKey(
        ProductType,
        verbose_name='Основа',
        on_delete=models.SET_NULL,
        null=True,
        related_name='basises'
    )

    def __str__(self):
        return self.name

    class Meta:
        ordering = ('-updated',)
        verbose_name = 'Продукт'
        verbose_name_plural = 'Продукты'
        indexes = [
            models.Index(fields=['id', 'slug']),
        ]

    def get_absolute_url(self):
        return reverse('product-detail', kwargs={'slug': self.slug})

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)


class Property(models.Model):
    """ Properties of products, tec-info """
    name = models.CharField('Свойство', max_length=200, db_index=True, unique=True)
    alias = models.CharField('Алиас', max_length=200, db_index=True)
    slug = models.SlugField(max_length=50, unique=True, db_index=True)
    product_type = models.ManyToManyField(ProductType, verbose_name='Основа', related_name='product_types')

    def __str__(self):
        return f'{self.alias}'

    def save(self, *args, **kwargs):
        """ Save generation slug """
        if not self.id:
            self.slug = gen_slug(self.name)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = 'Свойства'
        verbose_name_plural = 'Свойства'
        indexes = [
            models.Index(fields=['id', 'slug']),
        ]


class Value(models.Model):
    """ The values of product property, which belong to product """
    value = models.CharField('Значение', max_length=200, db_index=True, unique=True)
    properties = models.ForeignKey(
        Property,
        verbose_name='Свойство',
        on_delete=models.SET_NULL,
        null=True,
        related_name='property')
    product = models.ForeignKey(Product, verbose_name='Продукт', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f'{self.value}'

    class Meta:
        verbose_name = 'Значение'
        verbose_name_plural = 'Значения'
        indexes = [
            models.Index(fields=['id', 'value']),
        ]


class ProductImg(models.Model):
    """ Photo-list of products, location under the main photo """
    product = models.ForeignKey(Product, verbose_name='Продукт', on_delete=models.CASCADE)
    name = models.CharField('Заголовок', max_length=100)
    image = models.ImageField('Изображение', upload_to='product_img/')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Фотография товара'
        verbose_name_plural = 'Фотографии товара'
