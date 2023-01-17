import 'package:flutter/material.dart';

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
      padding: padding,
      decoration: BoxDecoration(
          boxShadow: boxShadow,
          color: containerColor ?? HexColor("#2D2D3A"),
          borderRadius: BorderRadius.circular(15)),
      child: child,
    );
  }
}
