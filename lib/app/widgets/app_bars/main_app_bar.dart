import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../app_text/big_header_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  late final Widget? leading;
  late final List<Widget>? actions;
  late final bool showLogo;
  MainAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.showLogo = true,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _getLeading(),
      title: _getLogo(),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.primary,
      actions: [
        ...actions ?? [],
      ],
    );
  }

  @override
  Size get preferredSize => Size(0, 50);

  _getLeading() {
    return leading ?? Container();
    // IconButton(
    //   icon: Icon(
    //     Remix.menu_2_line,
    //     color: AppColors.textDarkColor,
    //   ),
    //   onPressed: () {},
    // );
  }

  Widget _getLogo() {
    if (showLogo == false) {
      return BigHeaderText(
        text: title,
        color: AppColors.textDarkColor,
      );
    }
    return Image.asset(
      'assets/images/logo.png',
      height: 25,
    );
  }
}
