import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF36454F);
  static const secondary = Color(0xFFD5E0EB);
  static const background = Color(0xFFF2F1F6);
  static const bottomSheetColor = Color(0xFFF2F1F6);
  static const surface = Colors.white;
  static const error = Colors.red;
  static const onError = Colors.white;
  static const onBackground = Color(0xFF0E0E0F);
  static const onSurface = Color(0xFF000000);
  static const onPrimary = Color(0xFF000000);
  static const onSecondary = Color(0xFF000000);
  static const textDarkColor = Color(0xFF000000);
  static const maroon = Color(0xFF6D0547);
  static const gold = Color(0xFFF1C644);
  static const inactive = Color(0xFFC5C5C7);
  static const grey = Color(0xFF8A8A8E);
  static const cardColor = Color(0xFF17171A);

  static LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFFD64F44),
      Color(0xFF36454F),
      Color(0xFF36454F),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient appBarGradient = LinearGradient(
    colors: [
      Color(0xFF0D0D0F).withOpacity(0.0),
      Color(0xFF3E3D41),
    ],
    transform: GradientRotation(2.49779),
  );
}

//background: var(--Wroom-Gradient, linear-gradient(315deg, #0D0D0F 0%, #3E3D41 100%, #3E3D41 100%, #3E3D41 100%));
