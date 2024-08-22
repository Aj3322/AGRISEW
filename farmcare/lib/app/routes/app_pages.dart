import 'package:farmcare/app/modules/crop_management/views/views_crop_management_view.dart';
import 'package:farmcare/app/modules/disease_identification/bindings/views_disease_identification_binding.dart';
import 'package:farmcare/app/modules/home/bindings/home_binding.dart';
import 'package:farmcare/app/modules/home/views/home_view.dart';
import 'package:farmcare/app/modules/home/views/main_view.dart';
import 'package:get/get.dart';

import '../modules/calendar_integration/views/views_calendar_integration_view.dart';
import '../modules/disease_identification/views/views_disease_identification_view.dart';
import '../modules/seed_quality/views/views_seed_quality_view.dart';
import '../modules/soil_quality/views/views_soil_quality_view.dart';
import '../modules/weather_forecasting/views/views_weather_forecasting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding()
    ),
    GetPage(
      name: _Paths.DISEASE_IDENTIFICATION,
      page: () => ViewsDiseaseIdentificationView(),
      binding: ViewsDiseaseIdentificationBinding()
    ),
    GetPage(
      name: _Paths.CROP_MANAGEMENT,
      page: () => ViewsCropManagementView(),
    ),
    GetPage(
      name: _Paths.SEED_QUALITY,
      page: () => ViewsSeedQualityView(),
    ),
    GetPage(
      name: _Paths.WEATHER_FORECASTING,
      page: () => ViewsWeatherForecastingView(),
    ),
    GetPage(
      name: _Paths.CALENDAR_INTEGRATION,
      page: () => ViewsCalendarIntegrationView(),
    ),
    GetPage(
      name: _Paths.SOIL_QUALITY,
      page: () => ViewsSoilQualityView(),
    ),
  ];
}



