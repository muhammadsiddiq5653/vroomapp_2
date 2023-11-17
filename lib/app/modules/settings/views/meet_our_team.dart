import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/app_bars/inside_app_bar.dart';

class MeetTeam extends StatelessWidget {
  const MeetTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InsideAppBar(
        title: 'About the Team',
      ),
      body: Column(
        children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
          itemCount: 5, // Adjust the itemCount based on your requirements
          itemBuilder: (BuildContext context, int index) {
            return customCard();
          },
      ),
        ),
        ],
      ),
    );
  }
}

Widget customCard(){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: MediaQuery.of(Get.context!).size.height * 0.35,
      decoration: ShapeDecoration(
        color: Color(0xFF161619),
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
                color: Colors.grey, // You can set a background color if the image has transparency
                image: DecorationImage(
                  image: NetworkImage(
                    'https://example.com/your-image.jpg', // Replace with the actual image URL
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Christian Zigler',
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
              'Bachelor in Business Administration. Two times founder of successful technology companies. Two exits. Author of two books on marketing management.',
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
