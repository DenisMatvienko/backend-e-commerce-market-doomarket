# Generated by Django 3.0.7 on 2020-06-17 11:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название бренда')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
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
                ('slug', models.SlugField(unique=True)),
                ('description', models.TextField(verbose_name='Описание')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10, verbose_name='Цена')),
                ('available', models.BooleanField(default=True, verbose_name='Наличие товара')),
                ('created', models.DateTimeField(auto_now_add=True, verbose_name='Дата и время создания товара')),
                ('updated', models.DateTimeField(auto_now_add=True, verbose_name='Дата и время последнего изменения')),
                ('title_img', models.ImageField(upload_to='products/', verbose_name='Изображение')),
                ('brand', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Brand', verbose_name='Бренд')),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Category', verbose_name='Категория')),
                ('collection', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Collection', verbose_name='Коллекция')),
            ],
            options={
                'verbose_name': 'Продукт',
                'verbose_name_plural': 'Продукты',
                'ordering': ('-updated',),
            },
        ),
        migrations.CreateModel(
            name='Subcategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, verbose_name='Название подкатегории')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('slug', models.SlugField(unique=True)),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Category', verbose_name='')),
            ],
            options={
                'verbose_name': 'Подкатегория',
                'verbose_name_plural': 'Подкатегории',
            },
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(db_index=True, max_length=200, verbose_name='Свойство')),
                ('alias', models.CharField(db_index=True, max_length=200, verbose_name='Алиас')),
                ('data', models.CharField(max_length=200, unique=True, verbose_name='Значение')),
                ('slug', models.SlugField(unique=True)),
                ('product', models.ManyToManyField(to='shop.Product', verbose_name='Продукт')),
            ],
            options={
                'verbose_name': 'Свойства',
                'verbose_name_plural': 'Свойства',
            },
        ),
        migrations.CreateModel(
            name='ProductImg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, verbose_name='Заголовок')),
                ('image', models.ImageField(upload_to='product_img/', verbose_name='Изображение')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.Product', verbose_name='Продукт')),
            ],
            options={
                'verbose_name': 'Фотография товара',
                'verbose_name_plural': 'Фотографии товара',
            },
        ),
        migrations.AddField(
            model_name='product',
            name='subcategory',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.Subcategory', verbose_name='Подкатегория'),
        ),
        migrations.AddIndex(
            model_name='property',
            index=models.Index(fields=['id', 'slug'], name='shop_proper_id_0b90ab_idx'),
        ),
        migrations.AddIndex(
            model_name='product',
            index=models.Index(fields=['id', 'slug'], name='shop_produc_id_f21274_idx'),
        ),
    ]
