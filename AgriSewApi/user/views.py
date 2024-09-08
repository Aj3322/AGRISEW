from django.utils import timezone
import random
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.contrib import messages
from django.conf import settings
from twilio.rest import Client
from .models import FarmerUser, Farm 
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from django.core.serializers import serialize

class UserViews:
    @staticmethod
    def send_otp(phone, otp):
        """Send OTP via Twilio"""
        send_sms(
        'Here is the message',
    '+12065550100',
    ['+441134960000', '+441134960999']
)
        client = Client("AC6cccc489b8803d6da6eced335cda0ad4", "37f6b70d8a4e31e3f85c14912a83a68f")
        message = client.messages.create(
            body=f"Your OTP code is {otp}",
            from_="+12085040673",
            to=phone
        )
        return message.sid

    @staticmethod
    def generate_otp():
        """Generate a 6-digit OTP"""
        return random.randint(100000, 999999)
    
    @api_view(['POST'])
    def user_login(request):
        if request.method == 'POST':
            phone = request.POST.get('phone')

            # Check if phone number is registered
            try:
                farmer_user = FarmerUser.objects.get(user_phonenumber=phone)
            except FarmerUser.DoesNotExist:
                return JsonResponse({"message": "Phone number not registered. Please create an account."}, status=404)

            # Generate and send OTP
            otp = UserViews.generate_otp()
            farmer_user.otp = otp
            farmer_user.otp_sent_time = timezone.now()
            farmer_user.save()

            # Send OTP (implement your SMS sending logic)
            UserViews.send_otp(phone, otp)

            return JsonResponse({"message": "OTP sent. Please verify."})
        
        return JsonResponse({"error": "Invalid request method."}, status=400)

    @api_view(['POST'])
    def verify_otp(request, section):
        if request.method == 'POST':
            phone = request.data.get('phone')
            entered_otp = request.data.get('otp')

            try:
                farmer_user = FarmerUser.objects.get(user_phonenumber=phone)
            except FarmerUser.DoesNotExist:
                return JsonResponse({"message": "Phone number not registered."}, status=404)

            if farmer_user.otp == entered_otp:
                if farmer_user.otp_is_valid():
                    # Generate token after successful OTP validation
                    token, created = Token.objects.get_or_create(user=farmer_user.user)
                    # login(request,farmer_user.user)
                    return JsonResponse({"message": "OTP verified successfully", "token": token.key})
                else:
                    if section == 'signup':
                        farmer_user.delete()
                        farmer_user.user.delete()
                return JsonResponse({"message": "OTP has expired. Please request a new one."}, status=400)
            else:
                if section == "signup":
                    farmer_user.delete()
                    farmer_user.user.delete()
            return JsonResponse({"message": "Invalid OTP. Please try again."}, status=400)

        return JsonResponse({"error": "Invalid request method."}, status=400)

    @api_view(['POST'])
    def user_signup(request):
        """Complete Profile Setup and Create User"""
        phone = request.data.get('phone')
        if not phone:
            return Response({'error': 'Phone number is required'}, status=status.HTTP_400_BAD_REQUEST)

         # Generate and send OTP
        otp = UserViews.generate_otp()
        
        try:
           user , created = User.objects.get_or_create(username=phone)
           print(created)
           if created:
               
                farm_user = FarmerUser(user=user, user_phonenumber=phone)
                farm_user.otp = otp
                farm_user.otp_sent_time = timezone.now()
                farm_user.save()
                # Send OTP (implement your SMS sending logic)
                UserViews.send_otp(phone, otp)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)
        
        return JsonResponse({'message': "OTP send to your Phone "+str(phone),"status":status.HTTP_200_OK})


       


    @api_view(['GET'])
    def user_data(request):
        """Fetch farmer user by phone number"""
        phone = request.query_params.get('id')
        if phone:
            try:
                farmuser = FarmerUser.objects.filter(user_phonenumber="+"+phone.lstrip(' '))
                if farmuser:
                    serialized_data = serialize('json', farmuser)
                    return Response({"status": "success", "farmusers": serialized_data}, status=status.HTTP_200_OK)
                else:
                    return Response({"status": "Invalid Id"}, status=status.HTTP_400_BAD_REQUEST)
            except FarmerUser.DoesNotExist:
                return Response({"status": "Invalid Id"}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"status": "Phone number required"}, status=status.HTTP_400_BAD_REQUEST)


    @api_view(['PATCH'])
    def update_user(request):
        """Update user data directly from request body """
        data = request.data.get('user')  

        if not data or 'username' not in data:
            return Response({'error': 'Username is required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Get the user by username
            user = User.objects.get(username=data['username'])
            farmuser = FarmerUser.objects.get(user=user)

            # Update user fields from request data
            user.first_name = data.get('first_name', user.first_name)
            user.last_name = data.get('last_name', user.last_name)
            user.email = data.get('email', user.email)
            farmuser.user_location = data.get('user_location')
            farmuser.user_farmsize = data.get('user_farmsize')

            # Save the updated user object
            user.save()
            farmuser.save()

            return Response({
                'status': 'success',
                'user': {
                    'username': user.username,
                    'first_name': user.first_name,
                    'last_name': user.last_name,
                    'email': user.email,
                }
            }, status=status.HTTP_200_OK)

        except User.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
    @api_view(['POST', 'PATCH'])
    def upload_profile_image(request):
        """Upload or update profile image"""
        user_id = request.data.get('username')  # Ensure the user ID is provided
        try:
            user = User.objects.get(username=user_id)
            farmer_user, created = FarmerUser.objects.get_or_create(user=user)

            # Handle image upload
            if request.FILES.get('profile_image'):
                farmer_user.profile_image = request.FILES['profile_image']
                farmer_user.save()
                return Response({
                    'status': 'success',
                    'message': 'Profile image updated successfully',
                    'profile_image_url': farmer_user.profile_image.url
                }, status=status.HTTP_200_OK)
            else:
                return Response({
                    'status': 'error',
                    'message': 'No profile image provided'
                }, status=status.HTTP_400_BAD_REQUEST)

        except User.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
        
    @api_view(['DELETE'])
    def delete_user(request):
        phone = request.query_params.get('id')
        if phone:
            try:
                user=User.objects.get(username="+"+phone.lstrip(' '))
                user.delete()  
            except User.DoesNotExist:
                return Response({"status": "Invalid Id"}, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"status": "Phone number required"}, status=status.HTTP_400_BAD_REQUEST)
           

    @api_view(['POST'])
    def farm_task(request):
        """Add a new farm"""
        farm_name = request.data.get('farm_name')
        farm_location = request.data.get('farm_location')

        if not farm_name or not farm_location:
            return Response({"error": "Both farm name and location are required"}, status=status.HTTP_400_BAD_REQUEST)

        farm = Farm(farm_name=farm_name, farm_location=farm_location)
        farm.save()
        return Response({"status": "success"}, status=status.HTTP_201_CREATED)

        
