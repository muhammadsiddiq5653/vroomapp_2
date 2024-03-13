import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import '../../../app_enums.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_text/text_600.dart';
import '../controllers/home_controller.dart';
import 'home_garage_view.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

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
            : Column(
                children: [
                  Flexible(
                      flex: 4,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Text(
                            'Tap to Wroom',
                            style: TextStyle(
                              color: AppColors.surface,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
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
                      )),
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 400.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        color: AppColors.bottomSheetColor.withOpacity(0.9),
                        shape: BoxShape.rectangle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            HomeGarageView(),
                            transition: Transition.downToUp,
                            duration: Duration(milliseconds: 1000),
                            popGesture: true,
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'My Garage',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${controller.cars!.collection.length} cars',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 160.h,
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.cars!.collection.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var car = controller.cars!.collection[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.surface,
                                      border: Border.all(
                                        color: AppColors.primary,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Image.network(
                                      car.image!,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      )),
    );
  }

  Widget _getEmptyState() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  SizedBox(height: 30.h),
            Text700(
              text: "New to the app?",
              fontSize: 25.sp,
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/images/blankslatehome.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text600(
                text:
                    "You haven’t wroomed any cars, yet! Tap on the BIG RED button to get started.",
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
