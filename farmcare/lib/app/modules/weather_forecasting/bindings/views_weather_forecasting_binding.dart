import 'package:get/get.dart';

import '../controllers/views_weather_forecasting_controller.dart';

class ViewsWeatherForecastingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsWeatherForecastingController>(
      () => ViewsWeatherForecastingController(),
    );
  }
}
