from django.urls import path
from . import views


urlpatterns = [
    path('', views.ProductListView.as_view(), name='list'),
    path('<slug:slug>', views.ProductDetailView.as_view(), name='product-detail'),
    path('category/<slug:slug>', views.CategoryDetailView.as_view(), name='product-category'),
    path('subcategory/<slug:slug>', views.SubcategoryDetailView.as_view(), name='product-subcategory'),
    path('basis/<slug:slug>', views.BasisDetailView.as_view(), name='product-basis'),
]