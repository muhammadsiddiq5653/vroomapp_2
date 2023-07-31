import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

import '../../../../widgets/app_text/big_header_text.dart';
import '../../../../widgets/app_text/normal_text.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(item['image']!),
                BigHeaderText(
                  text: item['title'] ?? '',
                  color: Colors.white,
                  fontSize: 25,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                SmallText(
                  text: item['subtitle'] ?? '',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
