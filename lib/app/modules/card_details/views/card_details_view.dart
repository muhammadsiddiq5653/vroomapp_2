import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/helpers/widgets_to_image_controller.dart';
import 'package:vroom_app/app/modules/card_details/views/components/car_spec_progress.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/big_header_text.dart';
import 'package:vroom_app/app/widgets/widgets_to_image.dart.dart';
import '../../../app_colors.dart';
import '../../../widgets/app_network_image.dart';
import '../../../widgets/app_text/medium_header_text.dart';
import '../controllers/card_details_controller.dart';

class CardDetailsView extends GetView<CardDetailsController> {
  final controller = Get.put(CardDetailsController());
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();

  CardDetailsView({Key? key}) : super(key: key);

  List<String> title = [
    'Price',
    'HorsePower',
    'Mileage',
    'Weight',
  ];
  List<String> assetsLink = [
    'assets/images/price.png',
    'assets/images/horsepower.png',
    'assets/images/milage.png',
    'assets/images/weight.png',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardDetailsController>(
      builder: (_) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          child: AppStateHandler(
            loadingState: controller.loadingState,
            loadingWidget: Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 40.0.h,
                    horizontal: 17.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary.withOpacity(0.2)),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          controller.shareOutsideApp(
                            await widgetsToImageController.capture(),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary.withOpacity(0.2)),
                              child: Icon(
                                Icons.ios_share,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              icon: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primary.withOpacity(0.2)),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 23,
                                ),
                              ),
                              color: AppColors.background,
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: Text('Remove from Garage'),
                                    value: 'edit',
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      'Delete Car',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    value: 'delete',
                                  ),
                                  PopupMenuItem(
                                    child: Text('Share Car'),
                                    value: 'delete',
                                  ),
                                ];
                              },
                              onSelected: (value) async {
                                if (value == 'edit') {
                                  controller.deleteCar();
                                  // Get.toNamed(Routes.EDIT_CAR, arguments: controller.car);
                                } else if (value == 'delete') {
                                  controller.deleteCar();
                                } else if (value == 'share') {
                                  controller.shareOutsideApp(
                                    await widgetsToImageController.capture(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: WidgetsToImage(
                    controller: widgetsToImageController,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: 'car-card-${controller.car.hashCode}',
                              child: Container(
                                  width: double.infinity,
                                  child: AppNetworkImage(
                                    url: controller.car?.image ?? '',
                                  )),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 320.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigHeaderText(
                                            text: controller.car?.model ?? '',
                                            fontSize: 32.sp,
                                          ),
                                          BigHeaderText(
                                            text: controller.car?.year
                                                    .toString() ??
                                                '',
                                            fontSize: 32.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    BigHeaderText(
                                      text: controller.car?.make ?? '',
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 300.h,
                              width: double.infinity,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 2,
                                ),
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return CarSpecsCard(
                                    title: title[index],
                                    assetLink: assetsLink[index],
                                    value: index == 0
                                        ? AppUtilities.getPrice(controller
                                                .car!.price
                                                .toString()) ??
                                            ""
                                        : index == 1
                                            ? controller.car?.enginePower
                                                    .toString() ??
                                                ""
                                            : index == 2
                                                ? controller.car?.cityMilage
                                                        .toString() ??
                                                    ""
                                                : controller.car?.weight
                                                        .toString() ??
                                                    "",
                                  );
                                },
                              ),
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CarSpecsCard({
    required String title,
    required String value,
    required String assetLink,
  }) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff47555F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            assetLink,
            width: 40.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediumHeaderText(
                text: title,
                color: Colors.white,
              ),
              SizedBox(
                height: 10.h,
              ),
              MediumHeaderText(
                text: value,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
