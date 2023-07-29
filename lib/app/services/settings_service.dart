import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import '../app_constants.dart';
import './analytics_service.dart';

import '../data/models/app_settings_model.dart';
import '../data/models/auth_model.dart';

class SettingsService extends GetxService {
  final AnalyticsService analyticsService = Get.put(AnalyticsService());
  AppSettingsModel? settingsModel;
  AuthModel? authModel;
  List<CarModel> cars = [];
  final box = GetStorage();
  bool hasNotification = false;
  VoidCallback? isUserChnaged;
  bool notificationEnabled = true;
  @override
  void onInit() {
    super.onInit();
  }

  void setAuth(AuthModel authModel) {
    this.authModel = authModel;
    box.write(AppConstants.accessTokenKey, authModel.accessToken);
    analyticsService.logUser(authModel);
    if (isUserChnaged != null) {
      isUserChnaged!();
    }
  }

  void logout() {
    box.write(AppConstants.accessTokenKey, null);
    authModel = null;
    Get.offAllNamed(Routes.PREVIEW);
  }
}
