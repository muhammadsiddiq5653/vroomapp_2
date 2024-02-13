import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../../../widgets/app_bars/outer_app_bar.dart';
import '../../../widgets/app_text/text_400.dart';

class FaQs extends StatefulWidget {
  @override
  _FaQsState createState() => _FaQsState();
}

class _FaQsState extends State<FaQs> {
  List<Item> items = [
    Item(
        headerValue: 'How to Wroom Cars?',
        isExpanded: true,
        expandedValue:
            'Press the big red button, then follow the pictures to point your camera at a car. The car will be saved in your special place called a garage.'),
    Item(
        headerValue: 'What is the number on top right corner of screen?',
        expandedValue:
            'The number in the red box at the top right is how much all your cars cost together in your garage.'),
    Item(
        headerValue: 'How Can I post my car on the feed?',
        expandedValue:
            'If you want to show a picture of your car to your friends, press the big red button on the car details screen or look for the Share button when you finish wrooming your car. Then, everyone can see it on the Feed!'),
    Item(
        headerValue: 'How to Delete a post?',
        expandedValue:
            'To take away a picture you shared, press the three dots in the corner of the picture. But dont worry, your car stays in your garage!'),
    Item(
        headerValue: 'How to hide someone post?',
        expandedValue:
            'If you want to make a picture disappear from your feed, press the three dots in the corner of the picture and choose to hide it. And if you see a picture thats not okay, you can tell us by reporting it.'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
              color: AppColors.background
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 17.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  OuterAppBar(
                    title: 'FAQs',
                    centerTitle: true,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  ...List.generate(items.length, (index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                          decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].headerValue,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text400(
                                text: items[index].expandedValue,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }),

                  //
                  // Container(
                  //              padding: EdgeInsets.all(15.0),
                  //              child:
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
