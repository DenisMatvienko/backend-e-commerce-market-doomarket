from django.urls import path
from . import views


urlpatterns = [
    path('', views.ProductListView.as_view(), name='list'),
    path('<slug:slug>/', views.ProductDetailView.as_view(), name='product-detail'),
    # path('category/<str:slug>', views.ProductCategoryView.as_view(), name='product-category'),
]