import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/alerts/views/alerts_view.dart';
import 'package:vroom_app/app/modules/feed/views/feed_view.dart';
import 'package:vroom_app/app/modules/settings/views/meet_our_team.dart';
import 'package:vroom_app/app/widgets/app_bars/outer_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../widgets/app_text/small_text.dart';
import '../controllers/settings_controller.dart';
import 'FAQS.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);
  RxBool _switchValue = false.obs;

  // swap true/false & save it to observable
  void toggle() => _switchValue.value = _switchValue.value ? false : true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.primary,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text700(
          text: 'Settings',
          fontSize: 22,
          color: AppColors.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: AppColors.background),
          padding: EdgeInsets.all(17),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // launchUrlString(
                    //     controller.settingsService.settingsModel!.faq!);
                    Get.to(AlertsView());
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Text700(
                            text: 'Notifications',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    // launchUrlString(
                    //     controller.settingsService.settingsModel!.faq!);
                    Get.to(FeedView());
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Text700(
                            text: 'Image feed',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),

                SizedBox(
                  height: 10,
                ),
                //Stay in touch
                SmallText(
                  text: 'Stay in touch',
                  color: AppColors.primary.withOpacity(0.6),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid)
                      LaunchReview.launch(
                        androidAppId: "com.vroom.vroomApp",
                        //iOSAppId: "585027354",
                      );
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Remix.heart_3_fill,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text700(
                            text: 'Rate the app',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://www.instagram.com/thewroomapp');

                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Remix.instagram_line,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text700(
                            text: 'Follow on Instagram',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://www.tiktok.com/@thewroomapp');
                    // launchUrlString(
                    //     controller.settingsService.settingsModel!.faq!);
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Remix.music_2_line,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text700(
                            text: 'Follow on TikTok',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),

                GestureDetector(
                  onTap: () {
                    // launchUrlString(
                    //     controller.settingsService.settingsModel!.faq!);
                    Get.to(FaQs());
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Text700(
                            text: 'See FAQs',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                //Support
                SmallText(
                  text: 'Support',
                  color: AppColors.primary.withOpacity(0.6),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(MeetTeam());
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Text700(
                            text: 'About us',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                          Spacer(),
                          Icon(
                            Remix.arrow_right_s_line,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),

                SmallText(
                  text: 'Account',
                  color: AppColors.primary.withOpacity(0.6),
                ),

                GestureDetector(
                  onTap: () {
                    controller.settingsService.logout();
                  },
                  child: AppTile(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text700(
                              text: 'Log out',
                              fontSize: 16,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(
                            Icons.logout,
                            color: AppColors.primary,
                          )
                        ],
                      )),
                ),
                // GestureDetector(
                //   onTap: () {
                //     launchUrl(
                //         Uri.parse('http://wroom.zedandwhite.com/privacy/'));
                //   },
                //   child: AppTile(
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Text400(
                //             text: 'Read our Privacy Policy',
                //             fontSize: 16,
                //           ),
                //         ),
                //         Icon(
                //           Remix.arrow_right_s_line,
                //           color: Colors.white,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     launchUrl(Uri.parse('http://wroom.zedandwhite.com/terms'));
                //   },
                //   child: AppTile(
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Text400(
                //             text: 'Read our Terms',
                //             fontSize: 16,
                //           ),
                //         ),
                //         Icon(
                //           Remix.arrow_right_s_line,
                //           color: Colors.white,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // // SizedBox(
                // //   height: 30,
                // // ),
                // // AppTile(
                // //     padding: EdgeInsets.all(20),
                // //     child: Row(
                // //       children: [
                // //         Expanded(
                // //           child: Text400(
                // //             text: 'Rate and Review the App',
                // //             fontSize: 16,
                // //           ),
                // //         ),
                // //         Icon(
                // //           Remix.arrow_right_s_line,
                // //           color: Colors.white,
                // //         )
                // //       ],
                // //     )),
                // SizedBox(
                //   height: 45,
                // ),
                // Text700(
                //   text: 'Account',
                //   fontSize: 22,
                // ),
                // SizedBox(
                //   height: 25,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     controller.settingsService.logout();
                //   },
                //   child: AppTile(
                //       child: Row(
                //     children: [
                //       Expanded(
                //         child: Text400(
                //           text: 'Log out',
                //           fontSize: 16,
                //         ),
                //       ),
                //       Icon(
                //         Remix.arrow_right_s_line,
                //         color: Colors.white,
                //       )
                //     ],
                //   )),
                // ),
                //
                // SizedBox(
                //   height: 45,
                // ),
                //
                // Text700(
                //   text: 'Danger Zone',
                //   fontSize: 22,
                // ),
                // SizedBox(
                //   height: 25,
                // ),
                // // GestureDetector(
                // //   onTap: controller.deleteAccount,
                // //   child: AppTile(
                // //       child: Row(
                // //         children: [
                // //           Expanded(
                // //             child: Text400(
                // //               text: 'Reset my account',
                // //               fontSize: 16,
                // //               color: Colors.white,
                // //             ),
                // //           ),
                // //           Icon(
                // //             Remix.arrow_right_s_line,
                // //             color: Colors.white,
                // //           )
                // //         ],
                // //       )),
                // // ),
                // // SizedBox(
                // //   height: 15,
                // // ),
                // GestureDetector(
                //   onTap: () async {
                //     var result = await controller.dialogService.showConfirm(
                //         'We are sorry to see you go. All your data will be deleted. This action can not be undone.',
                //         title: 'Are you sure you want to delete your account?',
                //         confirmText: 'Proceed to Delete');
                //     controller.deleteAccount(result);
                //   },
                //   child: AppTile(
                //       child: Row(
                //     children: [
                //       Expanded(
                //         child: Text400(
                //           text: 'Delete my account',
                //           fontSize: 16,
                //           color: Colors.white,
                //         ),
                //       ),
                //       Icon(
                //         Remix.arrow_right_s_line,
                //         color: Colors.white,
                //       )
                //     ],
                //   )),
                // ),
              ]),
        ),
      ),
    );
  }
}
