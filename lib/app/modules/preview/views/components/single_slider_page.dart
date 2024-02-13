import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_text/big_header_text.dart';
import '../../controllers/preview_controller.dart';

class SingleSliderPage extends StatelessWidget {
  SingleSliderPage({
    Key? key,
    required this.item,
    required this.controller,
  }) : super(key: key);

  final Map<String, String> item;
  PreviewController controller;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: AppColors.primary,
    // );
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              BigHeaderText(
                text: item['title'] ?? '',
                color: Colors.white,
                fontSize: 28.sp,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15.h,
              ),
              SmallText(
                text: item['subtitle'] ?? '',
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 18.sp,
              ),
            ],
          )
        ],
      ),
    );
  }
}
