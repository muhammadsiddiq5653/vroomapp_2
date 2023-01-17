import 'package:flutter/material.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';
import '../../../../app_colors.dart';
import '../../../../data/models/user_model.dart';
import '../../../../widgets/app_profile_avatar.dart';

class LeaderBoardUserListTile extends StatelessWidget {
  final bool primary;
  final UserModel user;
  final Function(UserModel) onClick;
  final int type;
  final int? rank;
  final bool showRank;
  const LeaderBoardUserListTile(
      {Key? key,
      this.primary = false,
      required this.user,
      required this.onClick,
      this.type = 0,
      this.rank,
      this.showRank = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick(user);
      },
      child: AppTile(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            if (showRank)
              Text600(
                text: rank != null ? '$rank' : '1',
                fontSize: 20,
              ),
            if (showRank)
              SizedBox(
                width: 20,
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Container(
                color: AppColors.primary,
                child: Image.asset(
                  'assets/images/user.png',
                  width: 52,
                ),
              ),
            ),
            // AppProfileAvatar(size: 50, user: user),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text600(
                text: '${user.name ?? '@unnamed'}',
                fontSize: 16,
              ),
            ),
            Text600(
              text: '1233',
              color: AppColors.primary,
              fontSize: 16,
            )
          ],
        ),
      ),
    );
  }
}
