from django.test import TestCase, Client
from django.urls import reverse
from shop.models import *
import json


class TestView(TestCase):
    """ Testing view """

    def test_project_list_GET(self):
        client = Client()

        response = client.get(reverse('list'))

        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'shop/product_list.html')
