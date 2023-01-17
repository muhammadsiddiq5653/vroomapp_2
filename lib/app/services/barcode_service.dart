import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../app_exception.dart';

class BarcodeService extends GetxService {
  @override
  void onInit() {
    super.onInit();
  }

  Future<String?> scan() async {
    try {
      var result = await BarcodeScanner.scan();
      return result.rawContent;
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }
}
