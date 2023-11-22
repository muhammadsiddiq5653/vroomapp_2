import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_colors.dart';

class SliderDots extends StatelessWidget {
  const SliderDots({
    Key? key,
    required this.pages,
    required this.pageIndex,
  }) : super(key: key);

  final List<Map<String, dynamic>> pages;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pages.map((page) {
          int index = pages.indexOf(page);
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: index == pageIndex
                  ? Colors.white
                  : Colors.white.withOpacity(0.10),
            ),
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          );
        }).toList(),
      ),
    );
  }
}
