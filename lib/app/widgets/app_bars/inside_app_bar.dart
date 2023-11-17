import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

class InsideAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final bool centerTitle;
  late final Widget? leading;
  late final List<Widget>? actions;
  InsideAppBar(
      {required this.title,
      this.leading,
      this.actions,
      this.color,
      this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:GestureDetector(
        onTap: (){
          Get.back();

        },
        child: Image.asset("assets/images/backicon.png"),
      ),
      title: Text700(
        text: title,
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: color ?? Colors.transparent,
      foregroundColor: AppColors.primary,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size(0, 30);

  Widget _getLeading() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      child: leading ??
          AppButtonField(
              prefix: Image.asset("assets/images/backicon.png"),
              text: '< sasds',
              // primary: AppColors.primary,
              // textColor: Colors.white,
              onPressed: () {
                Get.back();
              }),
    );
  }
}
