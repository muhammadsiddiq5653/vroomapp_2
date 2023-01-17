import 'package:get/get.dart';

class PreviewController extends GetxController {
  int pageIndex = 0;
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

  void setPageIndex(int val) {
    pageIndex = val;
    update();
  }
}
