import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/custom_painter/app_header_coins_container_painter.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../app_bottom_sheet.dart';
import '../app_form_fields/app_button_field.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final box = GetStorage();
   late double? carValues;
  GameAppBar();

  @override
  Widget build(BuildContext context) {
    String value = box.read(AppConstants.userGarageValueKey) ?? "0";
    print(value);
    if(value != '0'){
      carValues = double.tryParse(value)!;
      carValues!.toPrecision(1);
    }
    else
      {
        carValues = 0.0;
      }

    return Container(
      height: 160.h,
      color: HexColor("#141415").withOpacity(0.6),
      padding: EdgeInsets.only(top: 50, left: 17, right: 0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/wroom.png',
              width: 100.w,
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
                              fontSize: 14.sp,
                              text:
                                  'This is the total value of cars in your garage. In the future, you will be able to do fun things with it :)',
                            ),
                            Container(
                              height: 50.h,
                              margin: EdgeInsets.only(top: 30),
                              width: double.infinity,
                              child: AppButtonField(
                                primary: AppColors.primary,
                                onPressed: () {
                                  Get.back(result: true);
                                },
                                text: 'okay',
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
      height: 80.h,
    );
  }

  Widget _getFuelWidget() {
      return Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
          height: 80.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getIconPair(
                      'assets/images/svg/coins.svg',
                      (carValues.toString() ??
                              '0') +
                          'K'),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // _getIconPair('assets/images/coins.png', "\$190,222")
                ],
              ),
              SizedBox(
                width: 30.h,
              ),
            ],
          ));

  }

  Row _getIconPair(String img, String title) {
    return Row(
      children: [
        SvgPicture.asset(
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
