import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/game_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

import '../controllers/alerts_controller.dart';

class AlertsView extends GetView<AlertsController> {
  const AlertsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/alertsEmptyState.png',
              width: 250,
            ),
            SmallBoldText(
              text: 'Nothing so far!',
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            SmallText(
              text: 'All your notifications will show up on this screen.',
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
