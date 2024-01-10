import 'package:flutter/material.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 65,
                ),
                Image.asset(item['image']!),
                SizedBox(
                  height: 20,
                ),
                BigHeaderText(
                  text: item['title'] ?? '',
                  color: Colors.white,
                  fontSize: 28,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                SmallText(
                  text: item['subtitle'] ?? '',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: 18,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
