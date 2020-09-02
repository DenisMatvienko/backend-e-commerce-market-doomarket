from celery import task
from django.core.mail import send_mail
from .models import Order


@task
def order_created(order_id):
    """ Task for sending mail-notification about success checking order  """
    order = Order.objects.get(id=order_id)
    subject = f'Заказ №{order.id}'
    message = f'Уважаемый(ая) {order.first_name},  Ваш заказ оформлен успешно. ' \
              f'Ваш заказ зарегистрирован под номером {order.id}'
    mail_sent = send_mail(subject, message, 'grabsomebuds27@gmail.com', [order.email])
    return mail_sent
