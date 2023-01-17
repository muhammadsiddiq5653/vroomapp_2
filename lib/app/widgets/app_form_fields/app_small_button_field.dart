import 'package:flutter/material.dart';

class AppSmallButtonField extends StatelessWidget {
  final String text;
  final Color? primary;
  final Color? textColor;
  final Widget? prefix;
  final double? width;
  final Function() onPressed;

  AppSmallButtonField(
      {required this.text,
      required this.onPressed,
      this.primary,
      this.width,
      this.prefix,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
      onPressed: onPressed,
      child: Container(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: prefix != null,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: prefix,
              ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
