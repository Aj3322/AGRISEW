import 'package:farmcare/app/modules/auth/views/otp_verification_view.dart';
import 'package:farmcare/app/modules/home/views/main_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../routes/app_pages.dart';
class AuthController extends GetxController {
  //TODO: Implement AuthController
  var isLoggedIn = false.obs;
  var authToken = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var phone = ''.obs;

  final String apiUrl = 'https://ajay3322.pythonanywhere.com/user'; // Replace with your API URL

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> login() async {

    isLoading.value = true;
    errorMessage.value = '';

    try {
      print("$apiUrl/login/");
      final response = await http.post(
        Uri.parse('$apiUrl/login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "phone": phone.value,
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar("Otp Send", response.body);
        Get.toNamed(Routes.OTPVERIFICATION,arguments: "login");
      } else {
        Get.snackbar("Otp Send", response.body);
        errorMessage.value = 'Login failed: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // Signup method
  Future<void> signup() async {
    isLoading.value = true;
    errorMessage.value = '';
    Get.snackbar("Click", "Phone ${phone.value}");
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/signup/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "phone": phone.value, // Encode the body as JSON
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Otp Send", response.body);
        Get.toNamed(Routes.OTPVERIFICATION,arguments: "signup"); // Navigate to OTP page
      } else {
        Get.snackbar("Error Message", response.body);
        errorMessage.value = 'Signup failed: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // Verify OTP
  Future<void> verifyOtp(String otp, String section) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/$section/verify_otp/'),
        headers: {'Content-Type': 'application/json; charset=UTF-8',},
        body: json.encode({'phone':'+919523137146','otp': otp}),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Otp Send", response.body);
        var data = json.decode(response.body);
        authToken.value = data['token'];
        isLoggedIn.value = true;
        Get.offAll(() => MainScreen()); // Navigate to the home page
      } else {
        Get.snackbar("Error Message", response.body);
        errorMessage.value = 'OTP verification failed: ${response.reasonPhrase}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  // Logout method
  void logout() {
    authToken.value = '';
    isLoggedIn.value = false;
  }
}
