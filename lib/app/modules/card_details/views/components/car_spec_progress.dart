import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_colors.dart';

class CarSpecProgress extends StatelessWidget {
  final double value;
  final String title;
  final String valueTitle;
  const CarSpecProgress(
      {Key? key,
      required this.value,
      required this.title,
      required this.valueTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Text(valueTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic)),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: value,
          ),
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            backgroundColor: AppColors.primary.withOpacity(0.25),
          ),
        ),
      ],
    );
  }
}
