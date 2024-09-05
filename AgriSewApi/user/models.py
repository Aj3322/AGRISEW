from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator

class FarmerUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    
    user_phonenumber = models.BigIntegerField(
        unique=True, 
        null=False, 
        blank=False, 
        validators=[MinValueValidator(1000000000), MaxValueValidator(9999999999)]
    )
    
    user_aadhaarnumber = models.BigIntegerField(
        unique=True, 
        null=True, 
        blank=False, 
        validators=[MinValueValidator(100000000000), MaxValueValidator(999999999999)]
    )
    
    user_location = models.CharField(max_length=255)
    user_farmsize = models.DecimalField(max_digits=10, decimal_places=2)
    language_preference = models.CharField(max_length=50)

    def __str__(self):
        return self.user.username

class Farm(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    farm_location = models.CharField(max_length=255)  
    soil_type = models.CharField(max_length=100)
    seed_variety = models.CharField(max_length=100) 
    soil_quality_report = models.TextField(blank=True, null=True)  
    seed_quality_report = models.TextField(blank=True, null=True) 

    def __str__(self):
        return f"Farm {self.id} of user {self.user.username}"



    

