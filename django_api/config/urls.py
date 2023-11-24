from django.contrib import admin
from django.urls import include, path
from .components.security import DEBUG

urlpatterns = [
    path('admin/', admin.site.urls),
]

if DEBUG is True:
    urlpatterns.append(path('__debug__/', include('debug_toolbar.urls')))
