import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_bars/inside_app_bar.dart';

class MeetTeam extends StatelessWidget {
  MeetTeam({super.key});

  List<String> descriptions = [
    'Bachelor in Business Administration. Two times founder of successful technology companies. Two exits. Author of two books on marketing management.',
    'Front end game designer. Bachelors in Computer Programming. Previously, Creative Director at Code Avenue (Karachi). Design Director at TickFilm Lead designer at Zed & White. ',
    'Full Stack Mobile Apps Developer .Bachelor in Software Engineering.I seamlessly blend technical virtuosity with an artist touch, crafting mobile masterpieces that transcend industry bounds. Committed to delivering high-caliber, timeless solutions, my work consistently exceeds the realm of digital expectations.'
  ];
  List<String> assetsUrls = [
    'assets/images/christian.jpeg',
    'assets/images/zed.jpeg',
    'assets/images/sid.jpg',
  ];
  List<String> name = [
    'Christian Zigler',
    'Zaryab Waseem',
    'Muhammad Siddiq',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      //0E0E0F
      appBar: InsideAppBar(
        title: 'About the Team',
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return customCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget customCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery
            .of(Get.context!)
            .size
            .height * 0.35,
        decoration: ShapeDecoration(
          color: Color(0xFF17171A).withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
                  color: Colors.grey,
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
                color: Colors.white,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontFamily: 'Exo 2',
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
                  color: Colors.white.withOpacity(0.8999999761581421),
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Exo 2',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}