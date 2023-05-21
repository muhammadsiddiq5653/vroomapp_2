import 'package:get/get.dart';

import '../modules/alerts/bindings/alerts_binding.dart';
import '../modules/alerts/views/alerts_view.dart';
import '../modules/battle/battle_step_battle_action/bindings/battle_step_battle_action_binding.dart';
import '../modules/battle/battle_step_battle_action/views/battle_step_battle_action_view.dart';
import '../modules/battle/battle_step_choose_car/bindings/battle_step_choose_car_binding.dart';
import '../modules/battle/battle_step_choose_car/views/battle_step_choose_car_view.dart';
import '../modules/battle/battle_step_matching_opponent/bindings/battle_step_matching_opponent_binding.dart';
import '../modules/battle/battle_step_matching_opponent/views/battle_step_matching_opponent_view.dart';
import '../modules/battle/bindings/battle_binding.dart';
import '../modules/battle/views/battle_view.dart';
import '../modules/card_details/bindings/card_details_binding.dart';
import '../modules/card_details/views/card_details_view.dart';
import '../modules/coins_inventory/bindings/coins_inventory_binding.dart';
import '../modules/coins_inventory/views/coins_inventory_view.dart';
import '../modules/customize_avatar/bindings/customize_avatar_binding.dart';
import '../modules/customize_avatar/views/customize_avatar_view.dart';
import '../modules/feed/bindings/feed_binding.dart';
import '../modules/feed/views/feed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/login_details_step/bindings/login_details_step_binding.dart';
import '../modules/login/login_details_step/views/login_details_step_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_tabs/bindings/main_tabs_binding.dart';
import '../modules/main_tabs/views/main_tabs_view.dart';
import '../modules/notifications_permission/bindings/notifications_permission_binding.dart';
import '../modules/notifications_permission/views/notifications_permission_view.dart';
import '../modules/pimp_my_ride/bindings/pimp_my_ride_binding.dart';
import '../modules/pimp_my_ride/views/pimp_my_ride_view.dart';
import '../modules/preview/bindings/preview_binding.dart';
import '../modules/preview/views/preview_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scan_car/bindings/scan_car_binding.dart';
import '../modules/scan_car/views/scan_car_view.dart';
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
      name: _Paths.BATTLE,
      page: () => BattleView(),
      binding: BattleBinding(),
      children: [
        GetPage(
          name: _Paths.BATTLE_STEP_MATCHING_OPPONENT,
          page: () => BattleStepMatchingOpponentView(),
          binding: BattleStepMatchingOpponentBinding(),
        ),
        GetPage(
          name: _Paths.BATTLE_STEP_BATTLE_ACTION,
          page: () => BattleStepBattleActionView(),
          binding: BattleStepBattleActionBinding(),
        ),
        GetPage(
          name: _Paths.BATTLE_STEP_CHOOSE_CAR,
          page: () => BattleStepChooseCarView(),
          binding: BattleStepChooseCarBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => LeaderboardView(),
      binding: LeaderboardBinding(),
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
      name: _Paths.PIMP_MY_RIDE,
      page: () => PimpMyRideView(),
      binding: PimpMyRideBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMIZE_AVATAR,
      page: () => const CustomizeAvatarView(),
      binding: CustomizeAvatarBinding(),
    ),
    GetPage(
      name: _Paths.ALERTS,
      page: () => const AlertsView(),
      binding: AlertsBinding(),
    ),
    GetPage(
      name: _Paths.FEED,
      page: () => const FeedView(),
      binding: FeedBinding(),
    ),
  ];
}
