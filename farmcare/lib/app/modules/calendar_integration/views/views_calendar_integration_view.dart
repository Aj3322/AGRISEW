import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/views_calendar_integration_controller.dart';

class ViewsCalendarIntegrationView
    extends GetView<ViewsCalendarIntegrationController> {
  const ViewsCalendarIntegrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewsCalendarIntegrationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ViewsCalendarIntegrationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
