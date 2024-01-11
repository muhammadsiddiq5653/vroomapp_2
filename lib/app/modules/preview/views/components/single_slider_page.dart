import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_text/big_header_text.dart';

class SingleSliderPage extends StatelessWidget {
  const SingleSliderPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: AppColors.primary,
    // );
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.backgroundGradient
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(27, 20, 27, 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 65.h,
                ),
                Image.asset(item['image']!),
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
            ),
          )
        ],
      ),
    );
  }
}
