# Generated by Django 5.1 on 2024-09-05 22:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0006_remove_farmeruser_user_aadhaarnumber_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='farmeruser',
            name='profile_image',
            field=models.ImageField(blank=True, null=True, upload_to='profile_images/'),
        ),
    ]
