import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import '../../../widgets/app_text/text_600.dart';
import '../controllers/home_controller.dart';

class WroomListPage extends GetView<HomeController> {
  final homeController = Get.put(HomeController());

  WroomListPage({Key? key}) : super(key: key);

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
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Wrooms',
            style: TextStyle(
              color: AppColors.onPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.cars?.collection.length ?? 0,
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 15.h,
                        )),
                    itemBuilder: (BuildContext context, int index) {
                      var car = controller.cars!.collection[index];
                      return Container(
                        height: 100.h,
                        width: 100.w,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.onCarTap(car);
                              },
                              child: Row(
                                children: [
                                  Image.network(
                                    car.image!,
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        car.model,
                                        style: TextStyle(
                                          color: AppColors.onPrimary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        car.make,
                                        style: TextStyle(
                                          color: AppColors.onPrimary,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 2.5.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(19),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/money-dollar.png',
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              car.price.toString(),
                                              style: TextStyle(
                                                color: AppColors.surface,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topRight,
                              child: PopupMenuButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                icon: Icon(
                                  Icons.more_horiz,
                                  color: AppColors.primary,
                                  size: 23,
                                ),
                                color: AppColors.background,
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      child: Text('View Details'),
                                      value: 'edit',
                                    ),
                                    PopupMenuItem(
                                      child: Text(
                                        'Delete Car',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      value: 'delete',
                                    ),
                                  ];
                                },
                                onSelected: (value) async {
                                  if (value == 'edit') {
                                    controller.onCarTap(car);
                                    // Get.toNamed(Routes.EDIT_CAR, arguments: controller.car);
                                  } else if (value == 'delete') {
                                    controller.deleteCar(car);
                                  } else if (value == 'share') {}
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
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
