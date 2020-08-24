from .cart import Cart


def cart(request):
    """ Context processor cart - add to context cart objects """
    return {'cart': Cart(request)}
