import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vroom_app/app/app_colors.dart';

class CarSpecProgress extends StatefulWidget {
  final double value;
  final String title;
  final String valueTitle;

  const CarSpecProgress({
    Key? key,
    required this.value,
    required this.title,
    required this.valueTitle,
  }) : super(key: key);

  @override
  State<CarSpecProgress> createState() => _CarSpecProgressState();
}

class _CarSpecProgressState extends State<CarSpecProgress> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Text(widget.valueTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic)),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: widget.value,
          ),
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            backgroundColor: AppColors.surface,
            color: AppColors.gold.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
