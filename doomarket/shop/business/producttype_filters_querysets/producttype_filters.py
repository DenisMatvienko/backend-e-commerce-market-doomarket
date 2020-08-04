from django.db.models import Q

from shop.models.product import Product
from shop.business.filters import FiltersPropertyValuesList


class ProductTypeFiltersView(FiltersPropertyValuesList):
    """ Filters set by product-type """
    def get_queryset(self):
        """ Into queryset organize search value __ in list of keys, which we 'GET' from html form by .getlist(key) """
        queryset = Product.objects.filter(
            Q(value__in=self.request.GET.getlist('width')) |
            Q(value__in=self.request.GET.getlist('depth')) |
            Q(value__in=self.request.GET.getlist('height')) |
            Q(value__in=self.request.GET.getlist('thickness')) |
            Q(value__in=self.request.GET.getlist('diagonal')) |
            Q(value__in=self.request.GET.getlist('length-bracelet'))
        ).distinct()
        return queryset
