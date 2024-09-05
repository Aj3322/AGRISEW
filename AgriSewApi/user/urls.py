from django.urls import path
from .views import UserViews as views

urlpatterns = [
    path("data/", views.user_data, name="user_task"),
    path("login/", views.user_login, name="user_login"),
    path('login/verify_otp/', views.verify_otp,{"section":"login"}, name='login_verify_otp'),
    path("signup/", views.user_signup, name="user_signup"),
    path('signup/verify_otp/', views.verify_otp,{"section":"signup"} ,name='signup_verify_otp'),
    path("update/" ,views.update_user,name="update" ),
    path("delete/" ,views.delete_user,{"section":"delete"},name="delete" ),
    path("farm_name/" , views.farm_task),
    path('upload_profile_image/', views.upload_profile_image, name='upload_profile_image'),
    
]
