import 'package:get/get.dart';

import '../controllers/views_crop_management_controller.dart';

class ViewsCropManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsCropManagementController>(
      () => ViewsCropManagementController(),
    );
  }
}
