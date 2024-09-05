import 'package:farmcare/app/shared/themes/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';


class MainScreen extends StatelessWidget {
  var selectedIndex = 0.obs;
  final List<String> _routes = [
    Routes.DISEASE_IDENTIFICATION,
    Routes.CROP_MANAGEMENT,
    Routes.SEED_QUALITY,
    Routes.WEATHER_FORECASTING,
    Routes.CALENDAR_INTEGRATION,
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return GetRouterOutlet(
          initialRoute: _routes[selectedIndex.value],
        );
      }),


      bottomNavigationBar: Obx(() {
        return
          BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist),
              label: 'Disease ID',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.agriculture),
              label: 'Crop Management',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grass),
              label: 'Seed Quality',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
          ],
          currentIndex: selectedIndex.value,
          selectedItemColor: ColorPalette.primaryColor,



          onTap: (index) {
            selectedIndex.value = index;
            Get.rootDelegate.toNamed(_routes[index]);
          },
        );
      }),
    );
  }
}

