import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
   SettingsView({Key? key}) : super(key: key);
   RxBool _switchValue = false.obs;
   // swap true/false & save it to observable
   void toggle() => _switchValue.value = _switchValue.value ? false : true;
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: InsideAppBar(
        title: 'Settings',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text700(
                  text: 'Basic',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Wroom Alerts',
                              fontSize: 16,
                            ),
                          ),
                          CupertinoSwitch(
                            value: _switchValue.value,
                            onChanged: (value) {

                                _switchValue = value.obs;

                            },
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Units',
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Text400(
                            text: 'Imperial',
                            fontSize: 16,
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'FAQs',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      )),
                ), SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Report an issue',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      )),
                ), SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Rate and Review the App',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Text700(
                  text: 'About Us',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.about!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Get to know the team',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_circle_fill,
                            color: Colors.red,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Rate and Review the App',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Text700(
                  text: 'Account',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: controller.deleteAccount,
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Delete your account',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_circle_fill,
                            color: Colors.red,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    controller.settingsService.logout();
                  },
                  child: AppTile(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Log out',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_circle_fill,
                            color: Colors.red,
                          )
                        ],
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
