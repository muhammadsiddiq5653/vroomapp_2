import 'package:flutter/material.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';

import '../data/models/user_model.dart';

class AppProfileAvatar extends StatelessWidget {
  final double size;
  final UserModel? user;
  final bool shouldEnlarge;

  AppProfileAvatar(
      {Key? key, required this.size, this.user, this.shouldEnlarge = false})
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
            child: user!.avatar == null
                ? Image.asset(
                    'assets/images/ProfileDummy.png',
                    width: size,
                    fit: BoxFit.fitWidth,
                  )
                : user!.avatar!.isEmpty
                    ? Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(size / 2),
                        ),
                        child: Icon(
                          Icons.person,
                          size: size / 2,
                        ),
                      )
                    : AppNetworkImage(
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
