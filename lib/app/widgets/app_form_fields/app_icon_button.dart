import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function() onPressed;
  const AppIconButton(
      {Key? key, required this.icon, required this.onPressed, this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        height: size,
        width: size,
        color: AppColors.primary,
        child: TextButton(
          child: Icon(
            icon,
            color: Colors.white,
            size: size * 0.50,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
