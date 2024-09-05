from django.db import models
from django.contrib.auth import User

# Create your models here.
class Farm_User(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE) 

    address = models.OneToOneField(Address, on_delete=models.CASCADE)
    phone_no = models.CharField(max_length=255)


class Address(models.Model):
    street = models.CharField(max_length=255)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=20)
    country = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.street}, {self.city}, {self.state}, {self.country}"
    