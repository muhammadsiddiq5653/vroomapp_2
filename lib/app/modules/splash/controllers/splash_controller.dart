import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app_constants.dart';
import '../../../app_enums.dart';
import '../../../app_exception.dart';
import '../../../data/api/app_settings_api.dart';
import '../../../data/api/auth_api.dart';
import '../../../routes/app_pages.dart';
import '../../../services/fcm_service.dart';
import '../../../services/local_notification_service.dart';
import '../../../services/sensor_service.dart';
import '../../../services/settings_service.dart';
import 'package:new_version/new_version.dart';

class SplashController extends GetxController {
  final appSettingsApi = Get.put(AppSettingsApi());
  final fcmService = Get.put(FcmService());
  final authApi = Get.put(AuthApi());
  final settingsService = Get.put(SettingsService());
  final sensorService = Get.put(SensorService());
  final localNotificationService = Get.put(LocalNotificationService());
  GeneralLoadingState loadingState = GeneralLoadingState.waiting;
  final newVersion = NewVersion();
  final box = GetStorage();
  bool forceUpdateView = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void init() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      update();
      settingsService.settingsModel = await appSettingsApi.getAppSettings();
      await Future.delayed(Duration(seconds: 3));
      if (settingsService.settingsModel?.forceUpdate == true) {
        forceUpdateView = true;
        update();
        return;
      } else {
        forceUpdateView = false;
      }

      try {
        var accessToken = box.read(AppConstants.accessTokenKey);
        if (accessToken != null) {
          var response = await authApi.signInWithtoken(accessToken);
          settingsService.setAuth(response);
        } else {
          Get.offAndToNamed(Routes.PREVIEW);
          return;
        }
      } catch (ex, stack) {
        captureException(ex, stackTrace: stack);
        Get.offAndToNamed(Routes.PREVIEW);
        return;
      }

      try {
        unawaited(fcmService.checkTokenAndSendToServer());
      } catch (ex) {}
      loadingState = GeneralLoadingState.done;

      try {
        sensorService.initSensors();
      } catch (ex, stack) {
        captureException(ex, stackTrace: stack);
      }

      try {
        localNotificationService.initialize();
        var messaging = FirebaseMessaging.instance;
        var settings = await messaging.getNotificationSettings();
        if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
          // ignore: unawaited_futures
          Get.offAndToNamed(Routes.NOTIFICATIONS_PERMISSION);
        } else {
          // ignore: unawaited_futures
          Get.offAndToNamed(Routes.MAIN_TABS);
        }
      } catch (ex) {
        Get.offAndToNamed(Routes.MAIN_TABS);
      }
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
      loadingState = GeneralLoadingState.error;
    } finally {
      update();
    }
  }
}
