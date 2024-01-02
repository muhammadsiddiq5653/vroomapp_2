import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../widgets/app_text/text_400.dart';
import '../controllers/coins_inventory_controller.dart';

class CoinsInventoryView extends GetView<CoinsInventoryController> {
  const CoinsInventoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: InsideAppBar(title: ''),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: _getTile(
                            '42 diamonds', 'assets/images/diamonds.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: _getTile(
                            '1213123 v-coins', 'assets/images/coins.png')),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                AppTile(
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Expanded(
                          child: Container(
                        color: Colors.black,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Text400(text: 'Watch this video to get 100 V-Coins')
                    ]),
                  ),
                  containerColor: HexColor("#17171A"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text700(text: 'Diamonds Packs'),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Text700(text: 'Coins Packs'),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ));
  }

  AppTile _getTile(String title, String img) {
    return AppTile(
      containerColor: AppColors.primary,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(children: [
          Image.asset(
            img,
            height: 24,
          ),
          SizedBox(
            height: 15,
          ),
          Text700(text: title)
        ]),
      ),
    );
  }
}
