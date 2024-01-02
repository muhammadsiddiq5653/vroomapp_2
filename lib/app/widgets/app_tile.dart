import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../helpers/hexcolor.dart';

class AppTile extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? containerColor;
  final Widget child;
  final List<BoxShadow>? boxShadow;
  AppTile(
      {this.containerColor, this.padding, required this.child, this.boxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      padding: padding ?? EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: containerColor ?? AppColors.cardColor,
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
