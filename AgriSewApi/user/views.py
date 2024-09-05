from django.shortcuts import render

from django.http import JsonResponse

from .models import FarmerUser , Farm

def user_task(request, section=None):
    if section=='add_farmer':
        farmusers = FarmerUser.objects.all().values()
        data = {
            "status": "success",
            "farmusers": list(farmusers)
        }
        return JsonResponse(data)
    else :
        return JsonResponse({"satatus":"Invalid"})

def Farm_task(request):
    if request.method == 'POST':
        farm = Farm()
        farm.farm_name = request.POST.get('farm_name')
        farm.farm_location = request.POST.get('farm_location')
        farm.save()
        return JsonResponse({"status": "success"})
    else:
        return JsonResponse({"status": "Invalid"})
    
