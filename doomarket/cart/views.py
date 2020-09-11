from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.http import require_POST
from shop.models.product import Product
from cart.business.cart import Cart
from .forms import CartAddProductForm
from coupons.forms import CouponApplyForm


@require_POST
def cart_add(request, product_id):
    """ Use decorator for require just POST method """
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    form = CartAddProductForm(request.POST)
    if form.is_valid():
        cd = form.cleaned_data
        cart.add(product=product, quantity=cd['quantity'], update_quantity=cd['update'])
        return redirect('cart:cart_detail')


def cart_remove(request, product_id):
    """
    Get id of product as arg, raise from db and delete from cart, after all user redirect on cart_detail
    """
    cart = Cart(request)
    product = get_object_or_404(Product, id=product_id)
    cart.remove(product)
    return redirect('cart:cart_detail')


def cart_detail(request):
    """ Handler for list of products - viewing cart, by the data saving in request.session """
    cart = Cart(request)
    for item in cart:
        item['update_quantity_form'] = CartAddProductForm(initial={'quantity': item['quantity'], 'update': True})
    coupon_apply_form = CouponApplyForm()
    return render(request, 'cart/cart_detail.html', {'cart': cart, 'coupon_apply_form': coupon_apply_form})
