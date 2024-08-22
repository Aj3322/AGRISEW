import 'package:get/get.dart';

import '../controllers/views_disease_identification_controller.dart';

class ViewsDiseaseIdentificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsDiseaseIdentificationController>(
      () => ViewsDiseaseIdentificationController(),
    );
  }
}
