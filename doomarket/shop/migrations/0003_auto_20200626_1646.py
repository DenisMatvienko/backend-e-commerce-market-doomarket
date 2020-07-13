# Generated by Django 3.0.7 on 2020-06-26 13:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0002_auto_20200625_1506'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='icon_field',
            field=models.ImageField(blank=True, null=True, upload_to='category_icon/', verbose_name='Изображение'),
        ),
        migrations.AddField(
            model_name='subcategory',
            name='icon_field',
            field=models.ImageField(blank=True, null=True, upload_to='subcategory_icon/', verbose_name='Изображение'),
        ),
    ]
