import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';

import '../controllers/notifications_permission_controller.dart';

class NotificationsPermissionView
    extends GetView<NotificationsPermissionController> {
  const NotificationsPermissionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/notification.png",
                    width: 110,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'One last thing - Do You want to get alerts of what’s happening in the app?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'We recommend enabling notifications for Wroom so you stay up-to-date. You can change this option in the settings later.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: AppButtonField(
                primary: AppColors.primary,
                onPressed: () {
                  controller.checkNotification();
                },
                text: 'Enable notifications'.toUpperCase(),
              ),
            ),
            Container(
                height: 60,
                // margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: AppButtonField(
                  primary: Colors.transparent,
                  // haveBorder: false,
                  onPressed: () {
                    controller.skip();
                  },
                  text: 'Do it later in settings'.toUpperCase(),
                ))
          ],
        ),
      ),
    );
  }
}
