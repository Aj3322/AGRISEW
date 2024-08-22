import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/views_weather_forecasting_controller.dart';

class ViewsWeatherForecastingView
    extends GetView<ViewsWeatherForecastingController> {
  const ViewsWeatherForecastingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsWeatherForecastingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewsWeatherForecastingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
