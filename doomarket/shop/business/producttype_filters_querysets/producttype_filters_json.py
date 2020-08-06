from django.db.models import Q
from django.http import JsonResponse

from shop.models.product import Product
from shop.business.filters import FiltersPropertyValuesList


class JsonProductTypeFilterView(FiltersPropertyValuesList):
    """ Filters set by product-type in json """
    def get_queryset(self):
        """ Into queryset organize search value __ in list of keys, which we 'GET' from html form by .getlist(key) """
        queryset = Product.objects.filter(
            Q(value__in=self.request.GET.getlist('width')) |
            Q(value__in=self.request.GET.getlist('depth')) |
            Q(value__in=self.request.GET.getlist('height')) |
            Q(value__in=self.request.GET.getlist('thickness')) |
            Q(value__in=self.request.GET.getlist('diagonal')) |
            Q(value__in=self.request.GET.getlist('length-bracelet'))
        ).distinct().values('name', 'price', 'slug', 'title_img')
        return queryset

    def get(self, request, *args, **kwargs):
        queryset = list(self.get_queryset())
        return JsonResponse({'product': queryset}, safe=False)
