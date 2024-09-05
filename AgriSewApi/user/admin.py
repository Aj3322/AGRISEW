from django.contrib import admin 
from .models import FarmerUser, Farm 
from rest_framework.authtoken.models import Token

admin.site.register(FarmerUser)
admin.site.register(Farm)
admin.site.register(Token)
# Register your models here.
