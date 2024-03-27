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
        headerValue: 'How do I capture my car\'s details? ',
        isExpanded: true,
        expandedValue:
            'Simply tap the large button floating on your screen, aim your camera at the car, and take a photo. Your car\'s information will then be stored in your personalized "My Garage".'),
    Item(
        headerValue: 'What does the special icon in the top right corner represent?',
        expandedValue:
            'The \$ symbol in the top right corner indicates the total value of all the cars in your garage.'),
    Item(
        headerValue: 'How can I showcase my car on the feed?',
        expandedValue:
            'If you\'re eager to flaunt your car, start by \'Wrooming\' it and then hit the "Share on Feed" button.'),
    Item(
        headerValue: 'How do I remove a post?',
        expandedValue:
            'To delete a post, open it and tap on the three dots in the top right corner. You\'ll find the delete option there. Remember, even if you delete a post, your car will still be safely stored in your garage.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'FAQs',
          style: TextStyle(
            color: AppColors.textDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.textDarkColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ...List.generate(items.length, (index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                      decoration: BoxDecoration(
                       border: Border.all(color: AppColors.primary, width: 1),
                          color: AppColors.bottomSheetColor,
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
                                fontWeight: FontWeight.bold,
                                color: AppColors.onBackground,


                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text400(
                            text: items[index].expandedValue,
                            fontSize: 14,
                            height: 1.6,
                            color: AppColors.onBackground,
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

            ],
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
