# Generated by Django 3.0.7 on 2020-09-10 14:25

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=50, unique=True, verbose_name='Код')),
                ('valid_from', models.DateTimeField(verbose_name='Действует от')),
                ('valid_to', models.DateTimeField(verbose_name='Действует до')),
                ('discount', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(100)], verbose_name='Скидка')),
                ('active', models.BooleanField(verbose_name='Срок активациии купона')),
            ],
        ),
    ]
