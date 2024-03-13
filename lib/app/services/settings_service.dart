import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    box.write(AppConstants.userId, authModel.userModel.id);
    box.write(AppConstants.userGarageValueKey, authModel.userModel.totalPrice.toString());
    box.write(AppConstants.userAvatarKey, authModel.userModel.avatar.toString());
    box.write(AppConstants.userFavouriteBrand, authModel.userModel.favoriteCarBrand.toString());
    box.write(AppConstants.userFullNameKey, authModel.userModel.name.toString());
    box.write(AppConstants.userPostsKey, authModel.userModel.posts.toString());
    box.write(AppConstants.userUserNameKey, authModel.userModel.username.toString());
    box.write(AppConstants.userWroomsKey, authModel.userModel.wrooms.toString());
    box.write(AppConstants.userPinKey, authModel.userModel.password.toString());
    analyticsService.logUser(authModel);
    if (isUserChnaged != null) {
      isUserChnaged!();
    }
  }

  void logout() async {
    box.write(AppConstants.accessTokenKey, null);
    box.erase();
    authModel = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(Routes.LOGIN_DETAILS_STEP);
  }
}
