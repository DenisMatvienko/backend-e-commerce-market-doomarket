from django.test import SimpleTestCase
from django.urls import reverse, resolve
from shop.views import *


class TestUrls(SimpleTestCase):
    """ Url-Product-list-Test """

    def test_list_url_is_resolved(self):
        url = reverse('list')
        print(resolve(url))
        self.assertEquals(resolve(url).func.view_class, ProductListView)

    def test_detail_url_resolved(self):
        """ Url-Product-detail-Test """

        url = reverse('product-detail', args=['slug-slug-sluggy'])
        self.assertEquals(resolve(url).func.view_class, ProductDetailView)