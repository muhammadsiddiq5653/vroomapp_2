import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

import '../../routes/app_pages.dart';
import '../main_tabs/controllers/main_tabs_controller.dart';
class TapToStart extends StatelessWidget {
   TapToStart({super.key});
  final mainTabsController = Get.put(MainTabsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.71, 0.71),
          end: Alignment(0.71, -0.71),
          colors: [Color(0xFF0D0C0E), Color(0xFF3D3C40)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Let’s Wroom your first car!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontFamily: 'Exo 2',
                fontWeight: FontWeight.w700,
                height: 0.05,
              ),
            ),
            GestureDetector(
                onTap: (){
                  //_showBottomSheet();
                  mainTabsController.scan();
                },
                child: Image.asset("assets/images/taptostart.png",height: Get.height*0.4,)),
            Text(
              'Tap on the button to start',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontFamily: 'Exo 2',
                fontWeight: FontWeight.w400,
                height: 0.06,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'No thanks, ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'I’ll do it later',
                    style: TextStyle(
                      color: Color(0xFFC90000),
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Exo 2',
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      height: 0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// void _showBottomSheet() {
//   Get.bottomSheet(
//     Container(
//       height: Get.height * 0.6,
//       decoration: ShapeDecoration(
//         color: Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15),
//             topRight: Radius.circular(15),
//           ),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text(
//               'Instructions to Wroom',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'Exo 2',
//                 fontWeight: FontWeight.w700,
//                 height: 0.09,
//               ),
//             ),
//             Container(
//               width: 253,
//               height: 135,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/view.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               'Wrooming a car works in a THREE QUARTER angle. Please make sure to hold your phone at the angle where your car looks similar to the above image to Wroom Successfully.',
//               textAlign: TextAlign.center,
//               maxLines: 3, // Set max lines to 3
//               overflow: TextOverflow.ellipsis, // Add this line to show ellipsis (...) for overflow
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'Exo 2',
//                 fontWeight: FontWeight.w400,
//                 height: 1.2, // You may adjust the height as needed
//               ),
//             ),
//
//             ElevatedButton(
//               onPressed: () {
//                 // Handle 'GOT IT' button tap
//                 Get.back(); // Close the bottom sheet
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xFFC90000),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               child: Container(
//                 width: 281,
//                 height: 55,
//                 child: Center(
//                   child: Text(
//                     'GOT IT',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Exo 2',
//                       fontWeight: FontWeight.w700,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle 'DON’T SHOW THIS AGAIN' button tap
//
//                 Get.toNamed(Routes.SIGNUP_STEP_DETAIL); // Close the bottom sheet
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Color(0xFF0E0E0F),
//                 side: BorderSide(color: Color(0xFFC90000)),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: Container(
//                 width: 281,
//                 height: 55,
//                 child: Center(
//                   child: Text(
//                     'DON’T SHOW THIS AGAIN',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Exo 2',
//                       fontWeight: FontWeight.w700,
//                       height: 0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
