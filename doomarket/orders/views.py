from django.shortcuts import render
from .models import OrderItem
from .forms import OrderCreateForm
from cart.business.cart import Cart


def order_create(request):
    """
        In this handler get object of cart with cart=Cart(request)
        Depending on method get:
        1) If Get request - initialize form OrderCreationForm and give into template orders/order/create.html
        2) If Post validate the data.
        2.1) If data valid- give the data into db - order=form.save(). After that get iter each of products in cart,
        and for each object create OrderItem. Finally clean the form in session and crate page of response into template
        orders/order/created.html
    """
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        if form.is_valid():
            order = form.save(commit=False)
            if cart.coupon:
                order.coupon = cart.coupon
                order.discount = cart.coupon.discount
            order.save()
            for item in cart:
                OrderItem.objects.create(order=order, product=item['product'], price=item['price'],
                                         quantity=item['quantity'])
            cart.clear()
            return render(request, 'orders/order/order_created.html', {'order': order})
    else:
        form = OrderCreateForm()
    return render(request, 'orders/order/order_create.html', {'cart': cart, 'form': form})

