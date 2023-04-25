import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';

import '../../../app_colors.dart';
import '../../../helpers/hexcolor.dart';
import '../controllers/customize_avatar_controller.dart';

class CustomizeAvatarView extends GetView<CustomizeAvatarController> {
  const CustomizeAvatarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InsideAppBar(
        title: 'Customize',
        centerTitle: true,
      ),
      body: Container(
        // color: Colors.black,
        padding: EdgeInsets.only(bottom: 20, top: 20),
        alignment: Alignment.topCenter,
        // height: 700,
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          FluttermojiCircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey[200],
          ),
          ElevatedButton(
              onPressed: () {
                controller.save();
              },
              child: Text('dd')),
          Spacer(),
          FluttermojiCustomizer(
            scaffoldWidth: double.infinity,
            autosave: false,
            theme: FluttermojiThemeData(
                primaryBgColor: AppColors.background,
                secondaryBgColor: HexColor("#2D2D3A"),
                labelTextStyle: TextStyle(color: AppColors.primary),
                boxDecoration: BoxDecoration(boxShadow: [BoxShadow()])),
          ),
        ]),
      ),
    );
  }
}
