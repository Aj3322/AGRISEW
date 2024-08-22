import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/views_crop_management_controller.dart';

class ViewsCropManagementView extends GetView<ViewsCropManagementController> {
  const ViewsCropManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsCropManagementView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewsCropManagementView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
