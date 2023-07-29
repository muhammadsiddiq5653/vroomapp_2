import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vroom_app/app/data/models/feed_model.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../../../app_constants.dart';
import '../../../helpers/hexcolor.dart';
import '../../../widgets/app_profile_avatar.dart';
import '../../../widgets/app_text/small_bold_text.dart';

class FeedCard extends StatelessWidget {
  FeedModel feedModel;
  Function(FeedModel) onLikeButton;
  Function(FeedModel) onShareButton;
  FeedCard(
      {super.key,
      required this.feedModel,
      required this.onLikeButton,
      required this.onShareButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: Colors.red,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          // color: Colors.black,
          child: Stack(fit: StackFit.loose, children: [
            AppNetworkImage(
              url: feedModel.image!,
              width: double.infinity,
            ),
            ClipRRect(
              child: Container(
                height: 70,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    color: HexColor("#2e2e2e").withOpacity(0.25),
                    child: Row(children: [
                      AppProfileAvatar(
                        size: 50,
                        user: feedModel.userModel,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallBoldText(
                        text: feedModel.userModel?.name ?? '',
                        color: Colors.white,
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                child: Container(
                  height: 70,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    color: HexColor("#2e2e2e").withOpacity(0.25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                onLikeButton(feedModel);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Remix.heart_2_line,
                                    color: Colors.white,
                                  ),
                                  SmallBoldText(
                                    text: feedModel.likes.toString(),
                                    color: Colors.white,
                                  )
                                ],
                              )),
                          OutlinedButton(
                              onPressed: () {
                                Get.toNamed(Routes.CARD_DETAILS, parameters: {
                                  AppConstants.carArgumentId:
                                      feedModel.userCarId.toString()
                                });
                              },
                              child: Text700(
                                text: 'View Card'.toUpperCase(),
                              )),
                          TextButton(
                              onPressed: () {
                                onShareButton(feedModel);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Remix.share_line,
                                    color: Colors.white,
                                  ),
                                  SmallBoldText(
                                    text: feedModel.shares.toString(),
                                    color: Colors.white,
                                  )
                                ],
                              )),
                        ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
