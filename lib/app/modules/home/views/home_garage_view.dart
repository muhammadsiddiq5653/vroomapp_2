import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/home/views/search_page.dart';
import 'package:vroom_app/app/modules/home/views/wroom_list.dart';
import 'package:vroom_app/app/widgets/app_bottom_sheet.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_text/text_600.dart';
import '../../card_details/views/components/car_card.dart';
import '../controllers/home_controller.dart';

class HomeGarageView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

  HomeGarageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController _) => AppKeyboardHider(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bottomSheetColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.SETTINGS);
            },
            icon: Icon(
              Remix.settings_2_fill,
              color: AppColors.grey,
            ),
          ),
          centerTitle: true,
          title: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 40.w,
              height: 8.h,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(
                  SearchPage(),
                );
              },
              icon: Icon(
                Remix.search_2_line,
                color: AppColors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.bottomSheet(
                  AppBottomSheet(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Wrap(
                        children: [
                          Column(
                            children: [
                              Text400(
                                textAlign: TextAlign.center,
                                fontSize: 14.sp,
                                color: AppColors.onPrimary,
                                text:
                                    'This is the total value of cars in your garage. In the future, you will be able to do fun things with it :)',
                              ),
                              Container(
                                height: 50.h,
                                margin: EdgeInsets.only(top: 30),
                                width: double.infinity,
                                child: AppButtonField(
                                  primary: AppColors.primary,
                                  onPressed: () {
                                    Get.back(result: true);
                                  },
                                  text: 'okay',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Image.asset(
                'assets/images/wroom_coin.png',
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
        backgroundColor: AppColors.bottomSheetColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          child: Image.asset('assets/images/wroom_button.png'),
          onTap: () {
            Get.toNamed(Routes.SCAN_CAR);
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Garage',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(WroomListPage());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Wrooms',
                          style: TextStyle(
                            color: AppColors.onPrimary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          controller.cars!.collection.length.toString(),
                          style: TextStyle(
                            color: AppColors.onPrimary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.onPrimary,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Wroomed recently',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                 GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.cars!.collection.length,
                    itemBuilder: (BuildContext context, int index) {
                      var car = controller.cars!.collection[index];
                      return CarCard(
                        car: car,
                        onTap: controller.onCarTap,
                        onLongTap: controller.onCarLongTap,
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 0.7,
                    ),
                  ),

              ],
            ),
          ),
        ),

        // child: Flex(
        //   direction: Axis.vertical,
        //   children: [
        //     SizedBox(
        //       height: 210.h,
        //     ),
        //     Text(
        //       'Tap to Wroom',
        //       style: TextStyle(
        //         color: AppColors.surface,
        //         fontSize: 30.sp,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 20.h,
        //     ),
        //     SizedBox(
        //       height: 300.h,
        //       child: RiveAnimation.asset(
        //         'assets/animations/wroom_pulse.riv',
        //         clipRect: Rect.fromCircle(
        //           center: Offset(280.w, 220.h),
        //           radius: 200.r,
        //         ),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     SizedBox(
        //       height: 40.h,
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.all(10.0),
        //     //   child: AppTextField(
        //     //       prefixIcon: Icon(
        //     //         Remix.search_2_line,
        //     //         color: AppColors.primary,
        //     //       ),
        //     //       suffixIcon: IconButton(
        //     //         icon: Icon(Remix.filter_3_fill),
        //     //         color: AppColors.primary,
        //     //         onPressed: controller.sortOption,
        //     //       ),
        //     //       onChanged: controller.searchChanged,
        //     //       hintText: 'Search',
        //     //       labelText: 'Search'),
        //     // ),
        //
        //
        //     AppStateHandler(
        //       loadingState: controller.loadingState,
        //       emptyWidget: _getEmptyState(),
        //       offlineWidget: _getOfflineState(),
        //       onRetry: () {
        //         controller.loadCards();
        //       },
        //       hasRefreshIndicator: true,
        //       child: LoadMore(
        //         isFinish: controller.cars?.haveNext == false,
        //         onLoadMore: () async {
        //           return await controller.loadCards(
        //               page: (controller.cars?.currentPage ?? 0) + 1);
        //         },
        //         child: ListView.separated(
        //             shrinkWrap: true,
        //             physics: NeverScrollableScrollPhysics(),
        //             itemCount: controller.cars?.collection.length ?? 0,
        //             separatorBuilder: ((context, index) => SizedBox(
        //                   height: 15.h,
        //                 )),
        //             itemBuilder: (BuildContext context, int index) {
        //               var car = controller.cars!.collection[index];
        //               return CarCard(
        //                   car: car,
        //                   onTap: controller.onCarTap,
        //                   onLongTap: controller.onCarLongTap);
        //             }),
        //       ),
        //     ),
        //   ],
        // ),
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
