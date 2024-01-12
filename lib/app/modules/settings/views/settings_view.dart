import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/settings/views/meet_our_team.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../controllers/settings_controller.dart';
import 'FAQS.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  RxBool _switchValue = false.obs;

  // swap true/false & save it to observable
  void toggle() => _switchValue.value = _switchValue.value ? false : true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.backgroundGradient
            ),
            padding: EdgeInsets.all(17),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OuterAppBar(
                    title: 'Settings',
                    centerTitle: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text700(
                    text: 'Basics',
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // AppTile(
                  //   padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Text400(
                  //           text: 'Wroom Alerts',
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //       CupertinoSwitch(
                  //         activeColor: AppColors.primary,
                  //         trackColor: Color(0xFFF131316),
                  //         value: _switchValue.value,
                  //         onChanged: (value) {
                  //           _switchValue = value.obs;
                  //           controller.update();
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // AppTile(
                  //     padding:
                  //         EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Text400(
                  //             text: 'Units',
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         Spacer(),
                  //         Text400(
                  //           text: 'Imperial',
                  //           fontSize: 16,
                  //         ),
                  //         Icon(
                  //           Remix.arrow_right_s_line,
                  //           color: Colors.white,
                  //         )
                  //       ],
                  //     )),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  GestureDetector(
                    onTap: () {
                      // launchUrlString(
                      //     controller.settingsService.settingsModel!.faq!);
                      Get.to(FaQs());
                    },
                    child: AppTile(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 15),
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
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // AppTile(
                  //     padding: EdgeInsets.all(20),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Text400(
                  //             text: 'Report an issue',
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         Icon(
                  //           Remix.arrow_right_s_line,
                  //           color: Colors.white,
                  //         )
                  //       ],
                  //     )),

                  SizedBox(
                    height: 45,
                  ),
                  Text700(
                    text: 'About Us',
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(MeetTeam());
                      // launchUrlString(
                      //     controller.settingsService.settingsModel!.about!);
                    },
                    child: AppTile(
                        child: Row(
                      children: [
                        Expanded(
                          child: Text400(
                            text: 'Get to know the team',
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
                    height: 15,
                  ),
                 if(Platform.isAndroid)
                  GestureDetector(
                    onTap: () {
                      LaunchReview.launch(
                        androidAppId: "com.vroom.vroomApp",
                        //iOSAppId: "585027354",
                      );


                    },
                    child: AppTile(
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
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(
                          Uri.parse('http://wroom.zedandwhite.com/privacy/'));
                    },
                    child: AppTile(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Read our Privacy Policy',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrl(
                          Uri.parse('http://wroom.zedandwhite.com/terms'));
                    },
                    child: AppTile(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text400(
                              text: 'Read our Terms',
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // AppTile(
                  //     padding: EdgeInsets.all(20),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Text400(
                  //             text: 'Rate and Review the App',
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //         Icon(
                  //           Remix.arrow_right_s_line,
                  //           color: Colors.white,
                  //         )
                  //       ],
                  //     )),
                  SizedBox(
                    height: 45,
                  ),
                  Text700(
                    text: 'Account',
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.settingsService.logout();
                    },
                    child: AppTile(
                        child: Row(
                      children: [
                        Expanded(
                          child: Text400(
                            text: 'Log out',
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
                    height: 45,
                  ),

                  Text700(
                    text: 'Danger Zone',
                    fontSize: 22,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // GestureDetector(
                  //   onTap: controller.deleteAccount,
                  //   child: AppTile(
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Text400(
                  //               text: 'Reset my account',
                  //               fontSize: 16,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           Icon(
                  //             Remix.arrow_right_s_line,
                  //             color: Colors.white,
                  //           )
                  //         ],
                  //       )),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  GestureDetector(
                    onTap: () async {
                      var result = await controller.dialogService.showConfirm(
                          'We are sorry to see you go. All your data will be deleted. This action can not be undone.',
                          title: 'Are you sure you want to delete your account?',
                          confirmText: 'Proceed to Delete'
                      );
                      controller.deleteAccount(result);

                    } ,
                    child: AppTile(
                        child: Row(
                      children: [
                        Expanded(
                          child: Text400(
                            text: 'Delete my account',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Remix.arrow_right_s_line,
                          color: Colors.white,
                        )
                      ],
                    )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
