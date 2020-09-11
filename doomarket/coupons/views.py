from django.shortcuts import render, redirect
from django.utils import timezone
from django.views.decorators.http import require_POST
from .models import Coupon
from .forms import CouponApplyForm


@require_POST
def coupon_apply(request):
    """
        Apply coupon
        1) Get data from CouponApplyForm
        2) If form is valid get "code"
        3) Try get active coupon, use iexact to get none-case sensitive coupon-word
        4) Coupon should be correct by time- less than or equal to (lte=now), Greater than or equal to (gte=now).
        5) Coupon should be active (active=True)
        6) Save coupon-id in session
        7) Redirect user on card_detail
    """
    now = timezone.now()
    form = CouponApplyForm(request.POST)
    if form.is_valid():
        code = form.cleaned_data['code']
        try:
            coupon = Coupon.objects.get(code__iexact=code,
                                        valid_from__lte=now,
                                        valid_to__gte=now,
                                        active=True)
            request.session['coupon_id'] = coupon.id
        except Coupon.DoesNotExist:
            request.session['coupon_id'] = None
        return redirect('cart:cart_detail')


