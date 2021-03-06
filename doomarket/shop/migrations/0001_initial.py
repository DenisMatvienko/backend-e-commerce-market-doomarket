# Generated by Django 3.0.7 on 2020-07-14 10:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Basis',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название основы')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
                ('icon_field', models.ImageField(blank=True, null=True, upload_to='basis_icon/', verbose_name='Изображение')),
            ],
            options={
                'verbose_name': 'Основа',
                'verbose_name_plural': 'Основы',
            },
        ),
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название бренда')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
                ('icon_field', models.ImageField(blank=True, null=True, upload_to='brand_icon/', verbose_name='Изображение')),
            ],
            options={
                'verbose_name': 'Бренд',
                'verbose_name_plural': 'Бренды',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название категории')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
                ('icon_field', models.ImageField(blank=True, null=True, upload_to='category_icon/', verbose_name='Изображение')),
            ],
            options={
                'verbose_name': 'Категория',
                'verbose_name_plural': 'Категории',
            },
        ),
        migrations.CreateModel(
            name='Collection',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название коллекции')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
            ],
            options={
                'verbose_name': 'Коллекция',
                'verbose_name_plural': 'Коллекции',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(db_index=True, max_length=250, verbose_name='Название продукта')),
                ('article', models.CharField(db_index=True, max_length=250, verbose_name='Артикул')),
                ('slug', models.SlugField(unique=True)),
                ('description', models.TextField(verbose_name='Описание')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='Цена')),
                ('available', models.BooleanField(default=True, verbose_name='Наличие товара')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Дата и время создания товара')),
                ('updated', models.DateTimeField(auto_now_add=True, verbose_name='Дата и время последнего изменения')),
                ('title_img', models.ImageField(upload_to='products/', verbose_name='Изображение')),
            ],
            options={
                'verbose_name': 'Продукт',
                'verbose_name_plural': 'Продукты',
                'ordering': ('-updated',),
            },
        ),
        migrations.CreateModel(
            name='ProductImg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='Заголовок')),
                ('image', models.ImageField(upload_to='product_img/', verbose_name='Изображение')),
            ],
            options={
                'verbose_name': 'Фотография товара',
                'verbose_name_plural': 'Фотографии товара',
            },
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(db_index=True, max_length=200, unique=True, verbose_name='Свойство')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('data', models.CharField(max_length=200, verbose_name='Значение')),
                ('slug', models.SlugField(unique=True)),
            ],
            options={
                'verbose_name': 'Свойства',
                'verbose_name_plural': 'Свойства',
            },
        ),
        migrations.CreateModel(
            name='Subcategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название подкатегории')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
                ('icon_field', models.ImageField(blank=True, null=True, upload_to='subcategory_icon/', verbose_name='Изображение')),
                ('categories', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Category', verbose_name='Категория')),
            ],
            options={
                'verbose_name': 'Подкатегория',
                'verbose_name_plural': 'Подкатегории',
            },
        ),
        migrations.AddIndex(
            model_name='property',
            index=models.Index(fields=['id', 'slug'], name='shop_proper_id_0b90ab_idx'),
        ),
        migrations.AddField(
            model_name='productimg',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.Product', verbose_name='Продукт'),
        ),
        migrations.AddField(
            model_name='product',
            name='basis',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='basises', to='shop.Basis', verbose_name='Основа'),
        ),
        migrations.AddField(
            model_name='product',
            name='brand',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='brands', to='shop.Brand', verbose_name='Бренд'),
        ),
        migrations.AddField(
            model_name='product',
            name='categories',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='categorys', to='shop.Category', verbose_name='Категория'),
        ),
        migrations.AddField(
            model_name='product',
            name='collection',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='collections', to='shop.Collection', verbose_name='Коллекция'),
        ),
        migrations.AddField(
            model_name='product',
            name='subcategories',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='subcategorys', to='shop.Subcategory', verbose_name='Подкатегория'),
        ),
        migrations.AddField(
            model_name='basis',
            name='properties',
            field=models.ManyToManyField(related_name='property', to='shop.Property', verbose_name='Свойство'),
        ),
        migrations.AddField(
            model_name='basis',
            name='subcategories',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Subcategory', verbose_name=''),
        ),
        migrations.AddIndex(
            model_name='product',
            index=models.Index(fields=['id', 'slug'], name='shop_produc_id_f21274_idx'),
        ),
    ]
