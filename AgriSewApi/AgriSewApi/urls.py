from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path,include
from .views import home


urlpatterns = [
    path("user/", include("user.urls")),
    path('admin/', admin.site.urls),
    path('', home),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)