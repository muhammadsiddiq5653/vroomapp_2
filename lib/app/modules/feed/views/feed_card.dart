import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../helpers/hexcolor.dart';
import '../../../widgets/app_text/small_bold_text.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    super.key,
  });

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
            Image.asset(
              'assets/images/carFeedDemo.png',
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
                      CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          child: Image.asset('assets/images/user.png')),
                      SizedBox(
                        width: 10,
                      ),
                      SmallBoldText(
                        text: 'Ramy Selim',
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
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      color: HexColor("#2e2e2e").withOpacity(0.25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Remix.heart_2_line,
                                      color: Colors.white,
                                    ),
                                    SmallBoldText(
                                      text: '55',
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Remix.share_line,
                                      color: Colors.white,
                                    ),
                                    SmallBoldText(
                                      text: '55',
                                      color: Colors.white,
                                    )
                                  ],
                                ))
                          ]),
                    ),
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
