import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app_constants.dart';
import '../app_exception.dart';
import '../data/api/app_users_api.dart';
import 'dialog_service.dart';
import 'settings_service.dart';

class FcmService extends GetxService {
  final SettingsService settingsService = Get.put(SettingsService());
  final AppUsersApi appUsersApi = Get.put(AppUsersApi());
  final DialogService dialogService = Get.put(DialogService());
  final box = GetStorage();
  FirebaseMessaging? messaging;
  @override
  void onInit() {
    messaging = FirebaseMessaging.instance;
    setupListner();
    super.onInit();
  }

  Future<void> requestPermission() async {
    await messaging?.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<void> checkTokenAndSendToServer() async {
    try {
      subscribeToAlTopic();
      if (settingsService.authModel?.userModel.id == null) return;
      var savedToken = box.read(AppConstants.firebaseToken);
      var newToken = await messaging?.getToken();
      if (newToken != null && newToken != savedToken) {
        unawaited(appUsersApi.addToken(
            newToken, settingsService.authModel!.userModel.id!));
        settingsService.authModel?.userModel.firebaseToken = newToken;
      }
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void subscribeToAlTopic() {
    try {
      messaging?.subscribeToTopic('all');
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void setupListner() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        dialogService.showInfo(message.notification!.body!, onTap: () {
          handleOperation(message);
        }, title: message.notification!.title!);
      }
    });

    messaging?.onTokenRefresh.listen((event) {
      checkTokenAndSendToServer();
    });
  }

  void hanldeWhileAppForgroundMessage() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleOperation(message);
    });
  }

  Future<void> handleInitialeMessage() async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    handleOperation(initialMessage);
  }

  Future<void> enableFcm() async {
    try {
      await messaging?.setAutoInitEnabled(true);
      await checkTokenAndSendToServer();
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  Future<void> disableFcm() async {
    try {
      await messaging?.setAutoInitEnabled(false);
      await messaging?.deleteToken();
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void handleOperation(RemoteMessage? message) {
    if (message == null) return;
    if (message.data['dl'] != null) {
      Get.toNamed(message.data['dl']);
    }
  }
}
