import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Do you want us to keep you updated?\n\nPress I am in if you are interested.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppButtonField(
              onPressed: () {
                controller.checkNotification();
              },
              text: 'Yes, I want in!',
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  controller.skip();
                },
                child: Text(
                  'I dont want to be updated.',
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
