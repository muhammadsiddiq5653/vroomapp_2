import 'package:get/get.dart';

import '../controllers/scan_car_controller.dart';

class ScanCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanCarController>(
      () => ScanCarController(),
    );
  }
}
