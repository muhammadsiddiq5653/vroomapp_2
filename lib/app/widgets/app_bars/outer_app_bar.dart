import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

class OuterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final bool centerTitle;
  late final Widget? leading;
  late final List<Widget>? actions;

  OuterAppBar(
      {required this.title,
      this.leading,
      this.actions,
      this.color,
      this.centerTitle = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 112,
          ),
          Text700(
            text: title,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(0, 20);
}
