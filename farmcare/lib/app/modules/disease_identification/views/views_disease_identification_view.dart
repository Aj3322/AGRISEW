import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/dialogview_view.dart';
import '../controllers/views_disease_identification_controller.dart';

class ViewsDiseaseIdentificationView
    extends GetView<ViewsDiseaseIdentificationController> {
  const ViewsDiseaseIdentificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsDiseaseIdentificationView'),
        centerTitle: true,
      ),
      drawer: const Drawer(child: DialogviewView()),
      body: const Center(
        child: Text(
          'ViewsDiseaseIdentificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
