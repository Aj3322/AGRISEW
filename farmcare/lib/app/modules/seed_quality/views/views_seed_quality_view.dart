import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/views_seed_quality_controller.dart';

class ViewsSeedQualityView extends GetView<ViewsSeedQualityController> {
  const ViewsSeedQualityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsSeedQualityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewsSeedQualityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
