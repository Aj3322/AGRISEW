from django.urls import path
from .views import user_task , Farm_task

urlpatterns = [
    path("", user_task, name="user_task"),
    path("add-farmer/" ,user_task,{"section":"add_farmer"},name="aj" ),
    path("farm_name/" , Farm_task)
    
]
