from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('shop.urls')),
    # path('api-auth/', include('rest_framework.urls')),
    # path('api/v1/', include('shop.urls')),

]


""" Если включен режим Debug джанго будет обрабатывать файлы медиа """
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)