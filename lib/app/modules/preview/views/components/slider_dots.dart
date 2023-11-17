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
              borderRadius: BorderRadius.circular(1.5),
              color: index == pageIndex
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.25),
            ),
            width: 16,
            height: 3,
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          );
        }).toList(),
      ),
    );
  }
}
