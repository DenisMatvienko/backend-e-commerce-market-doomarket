from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Coupon(models.Model):
    code = models.CharField('Код', max_length=50, unique=True)
    valid_from = models.DateTimeField('Действует от')
    valid_to = models.DateTimeField('Действует до')
    discount = models.IntegerField('Скидка', validators=[MinValueValidator(0), MaxValueValidator(100)])
    active = models.BooleanField('Активен')

    def __str__(self):
        return self.code

    class Meta:
        verbose_name = 'Купон'
        verbose_name_plural = 'Купоны'

