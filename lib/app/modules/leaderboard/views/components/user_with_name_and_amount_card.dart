import 'package:flutter/material.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_profile_avatar.dart';
import '../../../../widgets/app_text/text_600.dart';

class UserWithNameAndAmountCard extends StatelessWidget {
  final double? size;
  final Color color;
  final UserModel user;
  final int? rank;
  final bool showCrown;
  final Function(UserModel) onClick;

  final int type;
  const UserWithNameAndAmountCard(
      {Key? key,
      this.size,
      this.showCrown = false,
      this.color = Colors.white,
      required this.user,
      required this.onClick,
      this.rank,
      this.type = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    double finalSize = size ?? 70;
    return GestureDetector(
      onTap: () {
        onClick(user);
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                // color: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(finalSize / 2),
                  child: Container(
                    color: AppColors.primary,
                    child: Image.asset(
                      'assets/images/user.png',
                      width: finalSize,
                    ),
                  ),
                ),

                // AppProfileAvatar(
                //   size: finalSize,
                //   user: user,
                // )
              ),
              if (showCrown)
                Positioned(
                  top: -20,
                  child: Image.asset(
                    'assets/images/crown.png',
                    height: 42,
                  ),
                )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text400(
            text: '${user.name ?? '@unnamed'}',
            // maxLines: 1,
            textAlign: TextAlign.center,
            fontSize: 12,
            // overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Text600(
            text: '1223',
            color: AppColors.primary,
            // maxLines: 1,
            textAlign: TextAlign.center,
            fontSize: 14,
            // overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Positioned _getCircleRank() {
    return Positioned(
      bottom: -10,
      child: ClipOval(
        child: Container(
          height: 30,
          width: 30,
          color: color,
          child: Center(
              child: Text(
            rank != null ? rank.toString() : "1",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
