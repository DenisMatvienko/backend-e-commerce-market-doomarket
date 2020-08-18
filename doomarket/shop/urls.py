from django.urls import path
from django.contrib.auth import views as auth_views
from . import views


urlpatterns = [
    path('register/', views.register_page, name='register'),
    path('login/', views.login_page, name='login'),
    path('logout/', views.logout_user, name='logout'),

    path('', views.ProductListView.as_view(), name='list'),
    path('<slug:slug>', views.ProductDetailView.as_view(), name='product-detail'),
    path('category/<slug:slug>', views.CategoryDetailView.as_view(), name='product-category'),
    path('subcategory/<slug:slug>', views.SubcategoryDetailView.as_view(), name='product-subcategory'),
    path('product-type/<slug:slug>', views.ProductTypeDetailView.as_view(), name='product-type'),
    path('json-filter/', views.FilterProductsView.as_view(), name='json_filter'),

    # https://docs.djangoproject.com/en/3.1/topics/auth/default/#module-django.contrib.auth.views
    path(
        'accounts/password_reset/',
        auth_views.PasswordResetView.as_view(template_name='account/password_reset_form.html'),
        name='password_reset'),
    path(
        'accounts/password_reset/done/',
        auth_views.PasswordResetDoneView.as_view(template_name='account/password_reset_done.html'),
        name='password_reset_done'),
    path(
        'accounts/reset/<uidb64>/<token>/',
        auth_views.PasswordResetConfirmView.as_view(template_name='account/password_reset_confirm.html'),
        name='password_reset_confirm'),
    path(
        'accounts/reset/done/',
        auth_views.PasswordResetCompleteView.as_view(template_name='account/password_reset_complete.html'),
        name='password_reset_complete'),
]