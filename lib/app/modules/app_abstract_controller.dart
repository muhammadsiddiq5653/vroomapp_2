import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vroom_app/app/services/sound_service.dart';
import '../app_enums.dart';
import '../data/models/app_settings_model.dart';
import '../routes/app_pages.dart';
import '../services/analytics_service.dart';
import '../services/barcode_service.dart';
import '../services/dialog_service.dart';
import '../services/fcm_service.dart';
import '../services/settings_service.dart';

class AppAbstractController extends GetxController {
  final SettingsService settingsService = Get.put(SettingsService());
  final SoundService soundService = Get.put(SoundService());
  final DialogService dialogService = Get.put(DialogService());
  final AnalyticsService analyticsService = Get.put(AnalyticsService());
  final FcmService fcmService = Get.put(FcmService());
  final BarcodeService barcodeService = Get.put(BarcodeService());

  GeneralLoadingState loadingState = GeneralLoadingState.waiting;
  AppSettingsModel? settings() => settingsService.settingsModel;
  bool showBadge = false;
  final box = GetStorage();

  void setBadge(bool state) {
    showBadge = state;
    update();
  }

  bool isLoggedIn() {
    return settingsService.authModel != null;
  }

  Future<void> onLogin() async {
    await Get.toNamed(Routes.LOGIN);
    update();
  }

  Future<void> onSignup() async {
    await Get.toNamed(Routes.SIGNUP);
    update();
  }

  void logout() {
    settingsService.logout();
    update();
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void showLoading() {
    EasyLoading.show();
  }

  void hideLoading() {
    EasyLoading.dismiss();
  }
}
