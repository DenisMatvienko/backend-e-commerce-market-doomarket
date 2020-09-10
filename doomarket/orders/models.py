from django.db import models
from shop.models.product import Product


class Order(models.Model):
    """ Creation order  """
    first_name = models.CharField(verbose_name='Имя', max_length=50)
    last_name = models.CharField(verbose_name='Фамилия', max_length=50)
    email = models.EmailField()
    address = models.CharField(verbose_name='Адрес', max_length=250)
    postal_code = models.CharField(verbose_name='Почтовый код', max_length=20)
    city = models.CharField(verbose_name='Город', max_length=100)
    created = models.DateTimeField(verbose_name='Создан', auto_now_add=True)
    updated = models.DateTimeField(verbose_name='Изменен', auto_now=True)
    paid = models.BooleanField(verbose_name='Оплачен', default=False)

    class Meta:
        ordering = ('-created',)
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'

    def __str__(self):
        return f'Заказ №{self.id}'

    def get_total_cost(self):
        """ Total cost of products in order """
        return sum(item.get_cost() for item in self.items.all())


class OrderItem(models.Model):
    """ Save the product, quantity & price for each elements of cart """
    order = models.ForeignKey(Order, related_name='items', on_delete=models.CASCADE)
    product = models.ForeignKey(Product, related_name='order_items', on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f'Заказ №{self.id}'

    def get_cost(self):
        """ Total cost of cart """
        return self.price * self.quantity
