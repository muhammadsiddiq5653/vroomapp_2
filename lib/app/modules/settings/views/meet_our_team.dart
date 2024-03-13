import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../../../widgets/app_bars/outer_app_bar.dart';

class MeetTeam extends StatelessWidget {
  MeetTeam({super.key});

  List<String> descriptions = [
    'Bachelor in Business Administration. Two times founder of successful technology companies. Two exits. Author of two books on marketing management.',
    'Master in Software programming. CTO at Shopbox.com. UI Developer Link Management. Owner of Egypts biggest Paddle Tennis App.',
    'Front end game designer. Bachelors in Computer Programming. Previously, Creative Director at Code Avenue (Karachi). Design Director at TickFilm Lead designer at Zed & White. ',
    'Full Stack Mobile Apps Developer .Bachelor in Software Engineering. crafting mobile masterpieces that transcend industry bounds.'
  ];
  List<String> assetsUrls = [
    'assets/images/christian.jpeg',
    'assets/images/rami.jpg',
    'assets/images/zed.png',
    'assets/images/sid.jpg',
  ];
  List<String> name = [
    'Christian Zigler',
    "Ramy Salim",
    'Zaryab Waseem',
    'Muhammad Siddiq',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text('Meet Our Team'),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.onBackground,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return customCard(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        height: MediaQuery.of(Get.context!).size.height * 0.35,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.bottomSheetColor,
                  image: DecorationImage(
                    image: Image.asset(
                      assetsUrls[index],
                    ).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              name[index],
              style: TextStyle(
                color: AppColors.onBackground,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
              width: 281,
              child: Text(
                descriptions[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.onBackground,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
