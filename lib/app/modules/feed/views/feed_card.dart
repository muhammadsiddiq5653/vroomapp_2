import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/data/models/feed_model.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';

import '../../../app_constants.dart';
import '../../../helpers/hexcolor.dart';
import '../../../helpers/widgets_to_image_controller.dart';
import '../../../widgets/app_profile_avatar.dart';
import '../../../widgets/app_text/small_bold_text.dart';
import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/widgets_to_image.dart.dart';

class FeedCard extends StatelessWidget {
  FeedModel feedModel;
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();
  Function(FeedModel) onLikeButton;
  Function(FeedModel) onDeleteButton;
  Function(FeedModel, Uint8List?) onShareButton;
  bool notLoggedInCard;
  bool manageShare;
  bool notLoggedIn;

  FeedCard(
      {super.key,
      required this.feedModel,
      this.notLoggedInCard = false,
      this.notLoggedIn = false,
      this.manageShare = false,
      required this.onLikeButton,
      required this.onDeleteButton,
      required this.onShareButton});

  @override
  Widget build(BuildContext context) {
    return WidgetsToImage(
      controller: widgetsToImageController,
      child: GestureDetector(
        onTap: () {
          if (notLoggedInCard) {
            Get.toNamed(Routes.LOGIN_DETAILS_STEP);
          } else {
            Get.toNamed(Routes.CARD_DETAILS, parameters: {
              AppConstants.carArgumentId: feedModel.userCarId.toString()
            });
          }
        },
        child: Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
               color: AppColors.secondary,
              constraints: BoxConstraints(maxHeight: 545, minHeight: 545),
              child: Stack(
                  alignment: Alignment.center,
                  textDirection: TextDirection.ltr,
                  fit: StackFit.loose,
                  children: [
                    notLoggedInCard
                        ? Image.asset(
                            feedModel.image!,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          )
                        : AppNetworkImage(
                            url: feedModel.image!,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: 300.h,
                            loadingWidget: Container(
                                //RiveAnimation.asset(
                                //                                         'assets/images/vroom_animation.riv')
                                child:
                                    Center(child: CircularProgressIndicator())),
                          ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        child: Container(
                          height: 70.h,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              color: HexColor("#2e2e2e").withOpacity(0.25),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _getLeftHeader(context),

                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipRRect(
                        child: Container(
                          height: 70.h,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              // width: MediaQuery.of(context).size.width - 20,
                              color: HexColor("#2e2e2e").withOpacity(0.25),
                              child: Row(
                                  mainAxisAlignment: notLoggedInCard
                                      ? MainAxisAlignment.center
                                      : MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.ltr,
                                  children: [
                                    if (!notLoggedInCard)
                                      TextButton(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                            shape: StadiumBorder(),
                                          ),
                                          onPressed: () {
                                            onLikeButton(feedModel);
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                feedModel.liked
                                                    ? Remix.heart_fill
                                                    : Remix.heart_line,
                                                color: feedModel.liked
                                                    ? AppColors.error
                                                    : Colors.black,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              if (!notLoggedInCard)
                                                SmallBoldText(
                                                  text: feedModel.likes
                                                      .toString(),
                                                  color: Colors.black,
                                                )
                                            ],
                                          )),
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.transparent,
                                          shape: StadiumBorder(),
                                          side: BorderSide(
                                              width: 2.0, color: Colors.black),
                                        ),
                                        onPressed: () {
                                          if (notLoggedInCard) {
                                            Get.toNamed(
                                                Routes.LOGIN_DETAILS_STEP);
                                          } else {
                                            Get.toNamed(Routes.CARD_DETAILS,
                                                parameters: {
                                                  AppConstants.carArgumentId:
                                                      feedModel.userCarId
                                                          .toString()
                                                });
                                          }
                                        },
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 41,
                                            vertical: 16,
                                          ),
                                          child: Text700(
                                            text: notLoggedInCard
                                                ? "Login".toUpperCase()
                                                : 'View Card'.toUpperCase(),
                                            fontSize:
                                                notLoggedInCard ? 18.sp : 14.sp,
                                            color: Colors.black,
                                          ),
                                        )),
                                    if (!notLoggedInCard)
                                      TextButton(
                                          style: OutlinedButton.styleFrom(
                                            foregroundColor: Colors.transparent,
                                            shape: StadiumBorder(),
                                          ),
                                          onPressed: () async {
                                            onShareButton(
                                                feedModel,
                                                manageShare
                                                    ? null
                                                    : await widgetsToImageController
                                                        .capture());
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Remix.share_line,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              if (!notLoggedInCard)
                                                SmallBoldText(
                                                  text: feedModel.shares
                                                      .toString(),
                                                  color: Colors.black,
                                                )
                                            ],
                                          )),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  _getLeftHeader(BuildContext context) {
    return Row(
      children: [
        AppProfileAvatar(
          size: 42.h,
          user: feedModel.userModel,
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                feedModel.userModel?.name ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              feedModel.userModel?.username ?? '',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black.withOpacity(0.90),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
