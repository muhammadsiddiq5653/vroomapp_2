import 'package:get/get.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

class ProfileController extends AppAbstractController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
