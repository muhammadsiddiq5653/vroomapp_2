// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:vroom_app/app/app_colors.dart';
//
// import '../../../routes/app_pages.dart';
// import '../../../services/sound_service.dart';
// import '../../../widgets/app_form_fields/app_button_field.dart';
// import '../controllers/preview_controller.dart';
// import 'components/single_slider_page.dart';
// import 'components/slider_dots.dart';
//
// class PreviewView extends GetView<PreviewController> {
//   final controller = Get.put(PreviewController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PreviewController>(
//       builder: (_) => Scaffold(
//           body: Container(
//             height: double.infinity.h,
//             width: double.infinity.w,
//             child: Stack(
//               children: [
//                 FittedBox(
//                   fit: BoxFit.fitHeight,
//                   child: Container(
//                     width: controller.videoPlayerController.value.size.width,
//                     height: controller.videoPlayerController.value.size.height * 0.9,
//                     child: VideoPlayer(
//                       controller.videoPlayerController,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity.h,
//                   width: double.infinity.w,
//                   color: AppColors.background.withOpacity(0.5),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         Container(
//
//                           height: 55.h,
//                           width: double.infinity.w,
//                           margin: EdgeInsets.fromLTRB(47, 0, 47, 0),
//                           child: WroomGlowingButton(),
//                         ),
//                         SizedBox(
//                           height: 40.h,
//                         ),
//                         // Container(
//                         //   height: 55,
//                         //   width: double.infinity,
//                         //   margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//                         //   child: AppButtonField(
//                         //       primary: AppColors.primary,
//                         //       text: 'Login',
//                         //       elevation: 3,
//                         //       onPressed: () {
//                         //         Get.toNamed(Routes.LOGIN_DETAILS_STEP);
//                         //       }),
//                         // ),
//                         // SizedBox(
//                         //   height: 30,
//                         // ),
//                         // Container(
//                         //   height: 55,
//                         //   width: double.infinity,
//                         //   margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//                         //   child: AppButtonField(
//                         //       primary: Colors.transparent,
//                         //       text: 'Create an account',
//                         //       elevation: 0,
//                         //       onPressed: () {
//                         //         Get.toNamed(Routes.SIGNUP_STEP_PHONE);
//                         //       }),
//                         // ),
//                         // SizedBox(
//                         //   height: 70,
//                         // )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
//
//
// class WroomGlowingButton extends StatefulWidget {
//   @override
//   _WroomGlowingButtonState createState() => _WroomGlowingButtonState();
// }
//
// class _WroomGlowingButtonState extends State<WroomGlowingButton> {
//   final soundService = Get.put(SoundService());
//   bool _isGlowing = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Start the glowing animation
//     _startAnimation();
//   }
//
//   void _startAnimation() {
//     setState(() {
//       _isGlowing = true;
//     });
//     // Delay the stopping of the animation for smoother transition
//     Future.delayed(Duration(milliseconds: 500), () {
//       _stopAnimation();
//     });
//   }
//
//   void _stopAnimation() {
//     setState(() {
//       _isGlowing = false;
//     });
//     // Delay the starting of the animation for smoother transition
//     Future.delayed(Duration(milliseconds: 500), () {
//       _startAnimation();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: Duration(milliseconds: 1000),
//       curve: Curves.easeInOut,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: _isGlowing ? Colors.white : Colors.transparent,
//           width: _isGlowing ? 2.0 : 0.0,
//         ),
//         boxShadow: _isGlowing
//             ? [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             blurRadius: 20.0,
//             spreadRadius: 10.0,
//           ),
//         ]
//             : [],
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white.withOpacity(0.5),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           onTap: () {
//             // Handle button tap
//           },
//           child:
//           AppButtonField(
//               primary: Colors.black.withOpacity(0.9),
//               text: 'Let\'s Wroom',
//               haveBorder: false,
//               textColor: Colors.white.withOpacity(0.7),
//               elevation: 3,
//               onPressed: () {
//              //   soundService.playSoundOnStart();
//             Get.toNamed(Routes.MAIN_TABS);
//                 //Get.to(NotLoggedinProfile());
//                 //Get.to(NotLoggedinAlert());
//                 //Get.to(NotLoggedinFeed());
//                 //Get.to(NotLoggedinHome());
//               }),
//         ),
//       ),
//     );
//   }
// }
