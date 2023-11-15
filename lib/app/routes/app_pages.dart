import 'package:get/get.dart';
import 'package:vroom_app/app/modules/forgot_password_phone/views/forgot_password_phone_view.dart';
import 'package:vroom_app/app/modules/preview/bindings/preview_binding.dart';
import 'package:vroom_app/app/modules/preview/views/preview_view.dart';

import '../modules/alerts/bindings/alerts_binding.dart';
import '../modules/alerts/views/alerts_view.dart';
import '../modules/card_details/bindings/card_details_binding.dart';
import '../modules/card_details/views/card_details_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/coins_inventory/bindings/coins_inventory_binding.dart';
import '../modules/coins_inventory/views/coins_inventory_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/feed/bindings/feed_binding.dart';
import '../modules/feed/views/feed_view.dart';
import '../modules/forgot_password_phone/bindings/forgot_password_phone_binding.dart';
import '../modules/forgot_password_phone_verify/bindings/forgot_password_phone_verify_binding.dart';
import '../modules/forgot_password_phone_verify/views/forgot_password_phone_verify_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/login_details_step/bindings/login_details_step_binding.dart';
import '../modules/login/login_details_step/views/login_details_step_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_tabs/bindings/main_tabs_binding.dart';
import '../modules/main_tabs/views/main_tabs_view.dart';
import '../modules/notifications_permission/bindings/notifications_permission_binding.dart';
import '../modules/notifications_permission/views/notifications_permission_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scan_car/bindings/scan_car_binding.dart';
import '../modules/scan_car/views/scan_car_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/signup_step_detail/bindings/signup_step_detail_binding.dart';
import '../modules/signup/signup_step_detail/views/signup_step_detail_view.dart';
import '../modules/signup/signup_step_phone/bindings/signup_step_phone_binding.dart';
import '../modules/signup/signup_step_phone/views/signup_step_phone_view.dart';
import '../modules/signup/signup_step_verify/bindings/signup_step_verify_binding.dart';
import '../modules/signup/signup_step_verify/views/signup_step_verify_view.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW,
      page: () => PreviewView(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      children: [
        GetPage(
          name: _Paths.LOGIN_DETAILS_STEP,
          page: () => LoginDetailsStepView(),
          binding: LoginDetailsStepBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CARD_DETAILS,
      page: () => CardDetailsView(),
      binding: CardDetailsBinding(),
    ),
    GetPage(
      name: _Paths.COINS_INVENTORY,
      page: () => CoinsInventoryView(),
      binding: CoinsInventoryBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_CAR,
      page: () => ScanCarView(),
      binding: ScanCarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_TABS,
      page: () => MainTabsView(),
      binding: MainTabsBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS_PERMISSION,
      page: () => NotificationsPermissionView(),
      binding: NotificationsPermissionBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
      children: [
        GetPage(
          name: _Paths.SIGNUP_STEP_PHONE,
          page: () => SignupStepPhoneView(),
          binding: SignupStepPhoneBinding(),
        ),
        GetPage(
          name: _Paths.SIGNUP_STEP_VERIFY,
          page: () => SignupStepVerifyView(),
          binding: SignupStepVerifyBinding(),
        ),
        GetPage(
          name: _Paths.SIGNUP_STEP_DETAIL,
          page: () => SignupStepDetailView(),
          binding: SignupStepDetailBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ALERTS,
      page: () => AlertsView(),
      binding: AlertsBinding(),
    ),
    GetPage(
      name: _Paths.FEED,
      page: () => FeedView(),
      binding: FeedBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () =>  SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_PHONE,
      page: () => ForgotPasswordPhoneView(),
      binding: ForgotPasswordPhoneBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD_PHONE_VERIFY,
      page: () => ForgotPasswordPhoneVerifyView(),
      binding: ForgotPasswordPhoneVerifyBinding(),
    ),
  ];
}
