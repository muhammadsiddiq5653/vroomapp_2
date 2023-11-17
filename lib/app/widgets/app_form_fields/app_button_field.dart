import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_colors.dart';

class AppButtonField extends StatelessWidget {
  final String text;
  final Color? primary;
  final Color? textColor;
  final Widget? prefix;
  final double? elevation;
  final Function() onPressed;
  final bool haveBorder;
  final TextStyle? textStyle;

  AppButtonField(
      {required this.text,
      required this.onPressed,
      this.primary,
      this.prefix,
      this.textColor,
      this.haveBorder = true,
      this.textStyle,
      this.elevation});
  @override
  Widget build(BuildContext context) {
    if (primary == null ||
        primary == Colors.transparent ||
        haveBorder == false) {
      return _getButton();
    }
    return Container(
      decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.primary, offset: Offset(0, 2), blurRadius: 10)
          ]),
      child: _getButton(),
    );
  }

  _getButton() {
    bool haveText = !['', null].contains(text);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        elevation: elevation,
        side: BorderSide(
            color: haveBorder == false ? Colors.transparent : AppColors.primary,
            width: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefix != null)
            Padding(
              padding: EdgeInsets.only(right: haveText ? 10 : 0),
              child: prefix,
            ),
          if (haveText)
            Text(
              text.toUpperCase(),
              style: textStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}
