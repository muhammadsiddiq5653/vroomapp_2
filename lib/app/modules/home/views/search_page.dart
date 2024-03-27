import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/modules/home/controllers/search_controller.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_text_field.dart';
import 'package:vroom_app/app/widgets/app_keyboard_hider.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/loadmore.dart';
import '../../../widgets/app_text/text_600.dart';
import '../../card_details/views/components/car_card.dart';

class SearchPage extends GetView<SearchController> {
  final homeController = Get.put(SearchController());

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        builder: (SearchController _) => AppKeyboardHider(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColors.bottomSheetColor,
                    elevation: 0,
                  ),
                  backgroundColor: AppColors.bottomSheetColor,
                  body: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search Cars',
                          style: TextStyle(
                            color: AppColors.onPrimary,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        AppTextField(
                            prefixIcon: Icon(
                              Remix.search_line,
                              color: AppColors.primary,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Remix.filter_3_fill),
                              color: AppColors.primary,
                              onPressed: controller.sortOption,
                            ),
                            onChanged: controller.searchChanged,
                            hintText: 'Search',
                            labelText: 'Search'),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: AppStateHandler(
                            loadingState: controller.loadingState,
                            emptyWidget: _getEmptyState(),

                            onRetry: () {
                              controller.loadCards();
                            },
                            hasRefreshIndicator: true,
                            child: LoadMore(
                              isFinish: controller.cars?.haveNext == false,
                              onLoadMore: () async {
                                return await controller.loadCards(
                                    page: (controller.cars?.currentPage ?? 0) +
                                        1);
                              },
                              child: ListView.separated(
                                  itemCount:
                                      controller.cars?.collection.length ?? 0,
                                  separatorBuilder: ((context, index) =>
                                      SizedBox(
                                        height: 10,
                                      )),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var car =
                                        controller.cars!.collection[index];
                                    return CarCard(
                                        car: car,
                                        onTap: controller.onCarTap,
                                        onLongTap: controller.onCarLongTap);
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
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
              text: "No cars found",
              fontSize: 25.sp,
              textAlign: TextAlign.center,
              color: AppColors.onPrimary.withOpacity(0.7),
            ),
            Image.asset('assets/images/blankslatehome.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text600(
                text:
                    "We couldn't find any cars matching your search. Please try again.",
                textAlign: TextAlign.center,
                fontSize: 12.sp,
                color: AppColors.onPrimary.withOpacity(0.7),
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

          ],
        ),
      ),
    );
  }
}
