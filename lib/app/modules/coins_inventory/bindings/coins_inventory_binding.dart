import 'package:get/get.dart';

import '../controllers/coins_inventory_controller.dart';

class CoinsInventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinsInventoryController>(
      () => CoinsInventoryController(),
    );
  }
}
