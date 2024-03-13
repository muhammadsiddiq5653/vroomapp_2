import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_version/new_version.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vroom_app/app/services/fcm_service.dart';
import '../../../app_constants.dart';
import '../../../app_enums.dart';
import '../../../app_exception.dart';
import '../../../data/api/app_settings_api.dart';
import '../../../data/api/auth_api.dart';
import '../../../routes/app_pages.dart';
import '../../../services/local_notification_service.dart';
import '../../../services/sensor_service.dart';
import '../../../services/settings_service.dart';

class SplashController  extends GetxController  {
  final appSettingsApi = Get.put(AppSettingsApi());
  AnimationController? animationController;
   final fcmService = Get.put(FcmService());
  final authApi = Get.put(AuthApi());
  final settingsService = Get.put(SettingsService());
  final sensorService = Get.put(SensorService());
  final localNotificationService = Get.put(LocalNotificationService());
  GeneralLoadingState loadingState = GeneralLoadingState.waiting;
  final newVersion = NewVersion();
  final box = GetStorage();
  bool forceUpdateView = false;
  String version = '';
  String buildNumber = '';



  @override
  void onInit() {
    //writeToPreferences();
    getAppDetails();

    super.onInit();
  }

  // writeToPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("isloggedin",false);
  // }

  getAppDetails() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
  }

  @override
  void onReady() {
    super.onReady();
    init();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }

  void init() async {
    try {
      loadingState = GeneralLoadingState.waiting;
      update();
       settingsService.settingsModel = await appSettingsApi.getAppSettings();
     await Future.delayed(Duration(seconds: 1));
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
          if (response.accessToken.isNotEmpty) {
            Get.offAndToNamed(Routes.HOME);
            return;
          } else {
            Get.offAndToNamed(Routes.LOGIN_DETAILS_STEP);
            return;
          }
        } else {
          Get.offAndToNamed(Routes.LOGIN_DETAILS_STEP);
          return;
        }
      } catch (ex, stack) {
        captureException(ex, stackTrace: stack);
        Get.offAndToNamed(Routes.LOGIN_DETAILS_STEP);
        return;
      }


    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
      loadingState = GeneralLoadingState.error;
    } finally {
      update();
    }
  }
}
