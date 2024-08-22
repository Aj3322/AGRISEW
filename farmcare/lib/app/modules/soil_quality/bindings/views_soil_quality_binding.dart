import 'package:get/get.dart';

import '../controllers/views_soil_quality_controller.dart';

class ViewsSoilQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsSoilQualityController>(
      () => ViewsSoilQualityController(),
    );
  }
}
