import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/services/fcm_service.dart';
import 'package:vroom_app/app/services/sound_service.dart';

import '../app_enums.dart';
import '../data/models/app_settings_model.dart';
import '../routes/app_pages.dart';
import '../services/dialog_service.dart';
import '../services/settings_service.dart';

class AppAbstractController extends GetxController {
  final SettingsService settingsService = Get.put(SettingsService());
  final SoundService soundService = Get.put(SoundService());
  final DialogService dialogService = Get.put(DialogService());
  final FcmService fcmService = Get.put(FcmService());

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
    Get.offAllNamed(Routes.LOGIN_DETAILS_STEP);
    update();
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

}
