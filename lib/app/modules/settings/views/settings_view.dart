import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
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
                  text: 'About Us',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                AppTile(
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
                SizedBox(
                  height: 20,
                ),
                AppTile(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text400(
                            text: 'Rate and Review the game',
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Remix.arrow_right_circle_fill,
                          color: Colors.red,
                        )
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Text700(
                  text: 'Danger Zone',
                  fontSize: 20,
                ),
                SizedBox(
                  height: 30,
                ),
                AppTile(
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
