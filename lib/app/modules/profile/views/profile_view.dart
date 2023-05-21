import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../app_colors.dart';
import '../../../helpers/hexcolor.dart';
import '../../../widgets/app_form_fields/app_icon_button.dart';
import '../../../widgets/app_text/text_700.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController profileController = Get.put(ProfileController());
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              AppTile(
                  child: Container(
                padding: EdgeInsets.fromLTRB(10, 90, 10, 50),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIconButton(
                        onPressed: () {
                          // controller.logout();
                        },
                        icon: Remix.settings_2_fill,
                      ),
                      Column(
                        children: [
                          Text700(
                            text: controller.settingsService.authModel
                                    ?.userModel.name ??
                                '',
                            fontSize: 30,
                          ),
                        ],
                      ),
                      AppIconButton(
                        onPressed: () {},
                        icon: Remix.pencil_fill,
                      ),
                    ]),
              )),
              Positioned(
                top: -30,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.CUSTOMIZE_AVATAR);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      color: AppColors.primary,
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
