import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_text/big_header_text.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';
import '../../../widgets/app_bars/game_app_bar.dart';
import '../controllers/battle_controller.dart';

class BattleView extends GetView<BattleController> {
  final battleController = Get.put(BattleController());
  BattleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final battleOptions = [
      {
        'title': '1 V 1',
        'image': 'assets/images/battle.png',
        'clickable': true
      },
      {
        'title': 'Coming Soon'.toUpperCase(),
        'image': 'assets/images/multiplayercomingsoon.png',
        'clickable': false
      },
      {
        'title': 'Coming Soon'.toUpperCase(),
        'image': 'assets/images/fullstackcomingsoon.png',
        'clickable': false
      },
    ];
    return Scaffold(
      appBar: GameAppBar(
          userModel: battleController.settingsService.authModel!.userModel),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
            children: battleOptions
                .map((e) => Expanded(child: _getBattleOption(e)))
                .toList()),
      ),
    );
  }

  Widget _getBattleOption(Map<String, Object> e) {
    return GestureDetector(
      onTap: () {
        if (e['clickable'] as bool) Get.toNamed(Routes.BATTLE_STEP_CHOOSE_CAR);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: AppTile(
          child: Stack(alignment: Alignment.center, children: [
            Container(
              // height: 300,
              width: double.infinity,
              child: e['image'] != null
                  ? Image.asset(
                      e['image'] as String,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : null,
              // color: Colors.red,
            ),
            Positioned(
                bottom: 10,
                // left: 0,
                // right: 0,
                child: BigHeaderText(
                  text: e['title'] as String,
                  fontSize: 32,
                ))
          ]),
        ),
      ),
    );
  }
}
