import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const AppIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Container(
        height: 50.0,
        width: 50.0,
        color: AppColors.primary,
        child: TextButton(
          child: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
