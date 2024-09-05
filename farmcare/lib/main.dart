import 'package:farmcare/app/modules/auth/views/login_view.dart';
import 'package:farmcare/app/modules/auth/views/otp_verification_view.dart';
import 'package:farmcare/app/modules/auth/views/signup_view.dart';
import 'package:farmcare/app/modules/home/views/home_view.dart';
import 'package:farmcare/app/modules/home/views/main_view.dart';
import 'package:farmcare/app/modules/user/bindings/user_binding.dart';
import 'package:farmcare/app/modules/user/views/profile_setup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/themes/app_them.dart';
import 'app/views/views/location_access_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Farmer App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
     getPages: AppPages.routes,
      initialBinding: UserBinding(),
      home:ProfileSetupView(),
    );
  }
}
