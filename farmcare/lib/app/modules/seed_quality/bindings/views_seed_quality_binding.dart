import 'package:get/get.dart';

import '../controllers/views_seed_quality_controller.dart';

class ViewsSeedQualityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewsSeedQualityController>(
      () => ViewsSeedQualityController(),
    );
  }
}
