import 'package:get/get.dart';

import '../controllers/views_calendar_integration_controller.dart';

class ViewsCalendarIntegrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsCalendarIntegrationController>(
      () => ViewsCalendarIntegrationController(),
    );
  }
}
