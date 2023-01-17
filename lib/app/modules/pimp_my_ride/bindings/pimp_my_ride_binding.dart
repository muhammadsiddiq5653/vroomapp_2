import 'package:get/get.dart';

import '../controllers/pimp_my_ride_controller.dart';

class PimpMyRideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PimpMyRideController>(
      () => PimpMyRideController(),
    );
  }
}
