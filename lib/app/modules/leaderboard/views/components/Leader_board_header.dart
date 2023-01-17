import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../../../app_colors.dart';
import '../../../../data/models/user_model.dart';
import 'user_with_name_and_amount_card.dart';

class LeaderBoardHeader extends StatelessWidget {
  final List<UserModel> users;
  final int totalCount;
  final Function(UserModel) onUserclick;
  final List<Map> showFor;
  final int showForId;
  final Function(int) setShowForIndex;
  const LeaderBoardHeader(
      {Key? key,
      required this.users,
      required this.onUserclick,
      required this.totalCount,
      required this.showFor,
      required this.showForId,
      required this.setShowForIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                margin: EdgeInsets.only(bottom: 50, top: 40),
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: showFor.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = showFor[index];
                      var selected = item['id'] == showForId;
                      return InkWell(
                        onTap: () {
                          setShowForIndex(index);
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 10, top: 0),
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selected
                                        ? AppColors.primary
                                        : Colors.transparent),
                                color: selected
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              item['name'] as String,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                      );
                    }),
              ),
              if (users.length < 3)
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                      child: Column(
                    children: [
                      Icon(
                        Remix.emotion_happy_fill,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text400(text: 'No enough data yet, check again later.'),
                    ],
                  )),
                ),
              if (users.length > 2)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: UserWithNameAndAmountCard(
                          color: AppColors.primary,
                          user: users[1],
                          rank: 2,
                          type: showForId,
                          onClick: onUserclick,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 3,
                        child: UserWithNameAndAmountCard(
                          color: AppColors.primary,
                          size: 100,
                          user: users[0],
                          type: showForId,
                          rank: 1,
                          onClick: onUserclick,
                          showCrown: true,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 2,
                        child: UserWithNameAndAmountCard(
                          color: AppColors.primary,
                          user: users[2],
                          type: showForId,
                          rank: 3,
                          onClick: onUserclick,
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
