import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/home/views/home_garage_view.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import '../../../app_enums.dart';
import '../../../widgets/app_text/text_600.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

  double height = 200.h;

  toggleHeight() {
    if (height == 200.h) {
      height = 640.h;
    } else {
      height = 200.h;
    }
    homeController.update();
  }

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController _) => AppKeyboardHider(
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: controller.loadingState == GeneralLoadingState.waiting
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.surface,
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80.h,
                      ),
                      Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FadeAnimatedText(
                              'Tap to Wroom',
                              textStyle: TextStyle(
                                color: AppColors.surface,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FadeAnimatedText(
                              'Identify any Car',
                              textStyle: TextStyle(
                                color: AppColors.surface,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FadeAnimatedText(
                              'Pull it in your garage',
                              textStyle: TextStyle(
                                color: AppColors.surface,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: true,
                          repeatForever: true,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SCAN_CAR);
                        },
                        child: SizedBox(
                          height: 300.h,
                          child: RiveAnimation.asset(
                            'assets/animations/wroom_pulse.riv',
                            clipRect: Rect.fromCircle(
                              center: Offset(280.w, 220.h),
                              radius: 200.r,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          bottomSheet: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: height,
            child: BottomSheet(
              animationController: controller.animationController,
              onDragStart: (DragStartDetails) {
                print('dragging -- ${DragStartDetails.globalPosition}');

                if (DragStartDetails.globalPosition.dy > 200) {
                  toggleHeight();
                } else {
                  toggleHeight();
                }

                controller.update();
              },
              onDragEnd: (DragEndDetails, {isClosing = true}) {
                controller.update();
                // if (DragEndDetails.primaryVelocity! > 0) {
                //   Get.to(() => HomeGarageView());
                // } else {
                //   //   toggleHeight();
                // }
              },
              enableDrag: true,
              onClosing: () {
                controller.update();
              },
              builder: (BuildContext context) {
                return height > 200.h
                    ? HomeGarageView()
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Text(
                                  'My Garage',
                                  style: TextStyle(
                                    color: AppColors.onSurface,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  controller.cars!.collection.length
                                          .toString() +
                                      ' Cars',
                                  style: TextStyle(
                                    color: AppColors.onSurface,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                              ),
                              itemCount: controller.cars!.collection.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => HomeGarageView());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primary
                                              .withOpacity(0.5),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ],
                                      color: AppColors.surface,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Transform.rotate(
                                          angle: 3.14 / -10.5,
                                          child: Image.network(
                                            controller
                                                .cars!.collection[index].image!,
                                            height: 80.h,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          controller
                                              .cars!.collection[index].make,
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${controller.cars!.collection[index].model} - ${controller.cars!.collection[index].year}',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getEmptyState() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  SizedBox(height: 30.h),

          Image.asset('assets/images/blankslatehome.png'),
        ],
      ),
    );
  }

  Widget _getOfflineState() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Text700(
              text: "Are you offline?",
              fontSize: 25.sp,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/blankslatehome.png'),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text600(
                text:
                    "Make sure you are connected to internet. Your cars will show up when you are back online.",
                textAlign: TextAlign.center,
                fontSize: 12.sp,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 35.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Image.asset(
            //       'assets/images/arrow.png',
            //       height: 100,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
