from django.test import SimpleTestCase
from django.urls import reverse, resolve
from shop.views import ProductListView, ProductDetailView


class TestUrls(SimpleTestCase):
    """ Url-Product-list-Test """
    def test_list_url_is_resolved(self):
        url = reverse('list')
        self.assertEquals(resolve(url).func, ProductListView)