import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../../../../widgets/app_text/big_header_text.dart';
import '../../../../widgets/app_text/normal_text.dart';

class SingleSliderPage extends StatelessWidget {
  const SingleSliderPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
    );
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Image.asset(
          //   item['image'] ?? '',
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (item['icon'] != null)
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Icon(
                      item['icon'] as IconData,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                BigHeaderText(
                    text: item['subtitle'] ?? '', color: Colors.white),
                NormalText(
                  text: item['title'] ?? '',
                  color: Colors.white,
                ),
                Container(
                  height: 1,
                  width: 200,
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
