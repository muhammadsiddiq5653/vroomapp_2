import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../app_exception.dart';
import '../modules/app_abstract_controller.dart';
import 'settings_service.dart';

class SensorService extends GetxService {
  SettingsService settingsService = Get.put(SettingsService());
  AppAbstractController appAbstractController =
      Get.put(AppAbstractController());

  @override
  void onInit() {
    super.onInit();
  }

  void initSensors() {
    try {
      accelerometerEvents.listen((AccelerometerEvent event) {
        if (settingsService.authModel?.userModel == null ||
            settingsService.authModel?.accessToken == null) return;
        if (event.y < -1) {
          appAbstractController.setBadge(true);
        }
        if (event.y > -1) {
          appAbstractController.setBadge(false);
        }
      });
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }
}
