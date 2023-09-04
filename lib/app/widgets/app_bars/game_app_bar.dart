import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/custom_painter/app_header_coins_container_painter.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../services/settings_service.dart';
import '../app_bottom_sheet.dart';
import '../app_form_fields/app_button_field.dart';
import '../app_profile_avatar.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  UserModel userModel;
  GameAppBar({required this.userModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: HexColor("#141415"),
      padding: EdgeInsets.only(top: 50, left: 10, right: 0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logowithname.png',
              width: 150,
            ),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(AppBottomSheet(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Wrap(
                      children: [
                        Column(
                          children: [
                            Text400(
                              textAlign: TextAlign.center,
                              fontSize: 14,
                              text:
                                  'This is the total value of cars in your garage. In the future, you will be able to do fun things with it :)',
                            ),
                            Container(
                              height: 50,
                              margin: EdgeInsets.only(top: 30),
                              width: double.infinity,
                              child: AppButtonField(
                                primary: AppColors.primary,
                                onPressed: () {
                                  Get.back(result: true);
                                },
                                text: 'okay'.toUpperCase(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
              },
              child: CustomPaint(
                painter: AppHeaderCoinsContainerPainter(),
                child: _getFuelWidget(),
              ),
            )
          ]),
    );
  }

  Container _getProfileWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      height: 80,
    );
  }

  Container _getFuelWidget() {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getIconPair('assets/images/coins.png',
                    userModel.totalPrice?.truncate().toString() ?? '0'),
                // SizedBox(
                //   height: 5,
                // ),
                // _getIconPair('assets/images/coins.png', "\$190,222")
              ],
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ));
  }

  Row _getIconPair(String img, String title) {
    return Row(
      children: [
        Image.asset(
          img,
          height: 24,
        ),
        SizedBox(
          width: 10,
        ),
        SmallBoldText(
          text: title,
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(0, 80);
}
