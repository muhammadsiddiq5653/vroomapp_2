import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart'
    as channel;
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../app_exception.dart';
import 'dialog_service.dart';

class LocalNotificationService extends GetxService {
  DialogService dialogService = Get.put(DialogService());
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void onInit() {
    super.onInit();
  }

  void initialize() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      var initializationSettingsAndroid =
          AndroidInitializationSettings('notification_icon');
      final initializationSettingsIOS = IOSInitializationSettings(
          onDidReceiveLocalNotification: (_, title, body, payload) {
        dialogService.showInfo(body, title: title);
      });
      final initializationSettingsMacOS = MacOSInitializationSettings();
      final initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
          macOS: initializationSettingsMacOS);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: (data) {
        var message = Map.from(jsonDecode(data ?? ''));
        if (message['dl'] != null) {
          Get.toNamed(message['dl']);
        }
      });

      await channel.FlutterNotificationChannel.registerNotificationChannel(
        description: 'Uprise Main Notification Chaneel',
        id: 'high_importance_channel',
        importance: NotificationImportance.IMPORTANCE_HIGH,
        name: 'high_importance_channel',
        visibility: 1,
        allowBubbles: true,
        enableVibration: true,
        enableSound: true,
        showBadge: true,
      );
      tz.initializeTimeZones();
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void showNotification(
      {required String title, required String body, String? payload}) {
    try {
      flutterLocalNotificationsPlugin.show(1, title, body, null,
          payload: payload);
    } catch (ex) {}
  }

  void cancelNotification(id) {
    try {
      flutterLocalNotificationsPlugin.cancel(id);
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void scedualeNotification(String title, String body, DateTime date,
      {payload, id = 0}) async {
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(date, tz.local),
          const NotificationDetails(
              android: AndroidNotificationDetails(
                  'high_importance_channel', 'high_importance_channel')),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload: jsonEncode(payload));
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }
}
