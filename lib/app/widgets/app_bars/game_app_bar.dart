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

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final UserModel userModel;
  GameAppBar({
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#141415"),
      padding: EdgeInsets.only(top: 50, left: 10, right: 0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Container(
                        color: AppColors.primary,
                        child: Image.asset(
                          'assets/images/user.png',
                          width: 52,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 120,
                              child: SmallBoldText(
                                text: userModel.name ?? '',
                                color: Colors.white,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SmallText(
                          text: '@jjo',
                          color: Colors.white.withOpacity(0.7),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.COINS_INVENTORY);
              },
              child: CustomPaint(
                painter: AppHeaderCoinsContainerPainter(),
                child: Container(
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
                            _getIconPair('assets/images/battlepass.png', "4"),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // _getIconPair('assets/images/coins.png', "\$190,222")
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Remix.add_fill,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),
              ),
            )
          ]),
    );
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
