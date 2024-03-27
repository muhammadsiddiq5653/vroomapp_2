import 'package:flutter/widgets.dart';

class AppKeyboardHider extends StatelessWidget {
  final Widget child;
  AppKeyboardHider({required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
