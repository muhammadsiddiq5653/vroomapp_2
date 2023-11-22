import 'package:flutter/material.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';

import '../data/models/user_model.dart';

class AppProfileAvatar extends StatelessWidget {
  final double size;
  final UserModel? user;
  final bool shouldEnlarge;
  bool notLoggedInCard;

   AppProfileAvatar(
      {Key? key,
      required this.size,
      this.user,
      this.notLoggedInCard = false,
      this.shouldEnlarge = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size / 2),
            ),
            child:notLoggedInCard ?
            Image.asset('assets/images/ProfileDummy.png',
              width: 42,
              fit: BoxFit.fitWidth,

            ) :



            AppNetworkImage(
              url: user?.avatar ?? '',
              alignment: Alignment.center,
              width: size,
              height: size,
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
