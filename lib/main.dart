
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'app/routes/app_pages.dart';
import 'app/services/local_notification_service.dart';

late PackageInfo packageInfo;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  vroomApp();
}

vroomApp() async {
  await Firebase.initializeApp();
  await GetStorage.init();
  packageInfo = await PackageInfo.fromPlatform();
  Get.put(LocalNotificationService());
  var analytics = FirebaseAnalytics.instance;
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [
        GetObserver(),
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      builder: (_, child) {
        child =  child ?? Container();

        // Add botToastBuilder and MediaQuery functionality
        // child = botToastBuilder(_, child);
        child = MediaQuery(
          data: MediaQuery.of(_).copyWith(textScaleFactor: 1),
          child: child,
        );

        return child;
      },
      theme: ThemeData(fontFamily: 'Exo', scaffoldBackgroundColor: Colors.white)
          .copyWith(
              backgroundColor: AppColors.background,
              scaffoldBackgroundColor: AppColors.background,
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme(
                  primary: AppColors.primary,
                  secondary: AppColors.secondary,
                  surface: AppColors.surface,
                  background: AppColors.background,
                  error: AppColors.error,
                  onPrimary: AppColors.onPrimary,
                  onSecondary: AppColors.onSecondary,
                  onSurface: AppColors.onSurface,
                  onBackground: AppColors.onBackground,
                  onError: AppColors.onError,
                  brightness: Brightness.light)),
    ),
  );
}
