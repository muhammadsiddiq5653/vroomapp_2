import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;
  AppBottomSheet({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: child,
    );
  }
}
