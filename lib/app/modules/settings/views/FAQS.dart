import 'package:flutter/material.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';

import '../../../helpers/hexcolor.dart';
import '../../../widgets/app_bars/inside_app_bar.dart';
import '../../../widgets/app_text/text_400.dart';

class FaQs extends StatefulWidget {
  @override
  _FaQsState createState() => _FaQsState();
}

class _FaQsState extends State<FaQs> {
  List<Item> items = [
    Item(
        headerValue: 'How to Wroom Cars?',
        expandedValue:
            'Press the big red button, then follow the pictures to point your camera at a car. The car will be saved in your special place called a garage.'),
    Item(headerValue: 'What is the number on top right corner of screen?', expandedValue: 'The number in the red box at the top right is how much all your cars cost together in your garage.'),
    Item(headerValue: 'How Can I post my car on the feed?', expandedValue: 'If you want to show a picture of your car to your friends, press the big red button on the car details screen or look for the Share button when you finish wrooming your car. Then, everyone can see it on the Feed!'),
    Item(headerValue: 'How to Delete a post?', expandedValue: 'To take away a picture you shared, press the three dots in the corner of the picture. But dont worry, your car stays in your garage!'),
    Item(headerValue: 'How to hide someone post?', expandedValue: 'If you want to make a picture disappear from your feed, press the three dots in the corner of the picture and choose to hide it. And if you see a picture thats not okay, you can tell us by reporting it.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(0.8),
      appBar: InsideAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'FAQs',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontFamily: 'Exo 2',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ExpansionPanelList(
                elevation: 1,
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    items[index].isExpanded = !isExpanded;
                  });
                },
                children: items.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                    backgroundColor: HexColor("#17171A"),
canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text( item.headerValue,style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                        ),
                      );
                    },
                    body: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text400(
                        text: item.expandedValue,
                      ),
                    ),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ),
            // Text.rich(
            //   TextSpan(
            //     children: [
            //       TextSpan(
            //         text: 'Couldn’t find something? ',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 16,
            //           fontStyle: FontStyle.italic,
            //           fontFamily: 'Exo 2',
            //           fontWeight: FontWeight.w400,
            //           height: 0,
            //         ),
            //       ),
            //       TextSpan(
            //         text: 'Get in touch',
            //         style: TextStyle(
            //           color: Color(0xFFC90000),
            //           fontSize: 16,
            //           fontStyle: FontStyle.italic,
            //           fontFamily: 'Exo 2',
            //           fontWeight: FontWeight.w600,
            //           decoration: TextDecoration.underline,
            //           height: 0,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
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
