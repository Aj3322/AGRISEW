from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils import timezone
from datetime import timedelta

class FarmerUser(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    user_phonenumber = models.CharField(max_length=20,unique=True,null=False,blank=False)
    user_location = models.CharField(max_length=255,null=True, blank=True)
    user_farmsize = models.DecimalField(max_digits=10, decimal_places=2,null=True,blank=True),
    language_preference = models.CharField(max_length=50, default="en")
    

    # OTP Fields
    otp = models.CharField(max_length=6, blank=True, null=True)
    otp_sent_time = models.DateTimeField(blank=True, null=True)

    profile_image = models.ImageField(upload_to='profile_images/', null=True, blank=True)  # Image Upload
    def otp_is_valid(self):
        if self.otp_sent_time:
            return timezone.now() < self.otp_sent_time + timedelta(minutes=10) 
        return False

    def __str__(self):
        return self.user.username
    
    class META:
        db_table = 'FarmerUser'


class Farm(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    farm_location = models.CharField(max_length=255)  
    soil_type = models.CharField(max_length=100)
    seed_variety = models.CharField(max_length=100) 
    soil_quality_report = models.TextField(blank=True, null=True)  
    seed_quality_report = models.TextField(blank=True, null=True) 

    def __str__(self):
        return f"Farm {self.id} of user {self.user.username}"



    
