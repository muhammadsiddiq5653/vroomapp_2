import 'package:flutter/material.dart';

import 'app_tile.dart';

class AppListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Color containerColor;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsets? padding;
  AppListTile(
      {required this.leading,
      required this.title,
      this.containerColor: Colors.white,
      required this.trailing,
      this.padding,
      this.crossAxisAlignment});
  @override
  Widget build(BuildContext context) {
    return AppTile(
      containerColor: containerColor,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: [
              leading,
              SizedBox(
                width: 10,
              ),
              Expanded(child: title),
              SizedBox(
                width: 10,
              ),
              trailing,
            ],
          ),
        ],
      ),
    );
  }
}
