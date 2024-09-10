from django.http import JsonResponse


def home(request):
    return JsonResponse({"Status":"Success","message":"Welcome to the AgriSew" }, status=200) 