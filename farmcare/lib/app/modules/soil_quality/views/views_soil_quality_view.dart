import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/views_soil_quality_controller.dart';

class ViewsSoilQualityView extends GetView<ViewsSoilQualityController> {
  const ViewsSoilQualityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsSoilQualityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewsSoilQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
