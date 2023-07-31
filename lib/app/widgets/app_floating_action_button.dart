import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
    required this.onClick,
  });

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 5,
          backgroundColor: AppColors.primary,
          onPressed: () {
            onClick();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/scanicon.png',
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
