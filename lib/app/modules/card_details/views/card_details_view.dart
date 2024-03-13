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
                                    BigHeaderText(
                                      text: controller.car?.model ?? '',
                                      fontSize: 32.sp,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    MediumHeaderText(
                                      text: controller.car?.make ?? '',
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    MediumHeaderText(
                                      text:
                                          controller.car?.year.toString() ?? '',
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 35,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.onBackground.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/wroom_coin.png',
                                      width: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      AppUtilities.getPrice(controller.car!.price.toString()) ?? "",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CarSpecProgress(
                              title: 'Engine',
                              value: AppUtilities.getPowerPercentage(
                                controller.car?.enginePower,
                              ),
                              valueTitle: '',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CarSpecProgress(
                              title: 'City Milage',
                              value: AppUtilities.getCityMilagePercentage(
                                controller.car?.cityMilage,
                              ),
                              valueTitle: '',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CarSpecProgress(
                              title: 'Weight',
                              value: AppUtilities.getWeightPercentage(
                                controller.car?.weight,
                              ),
                              valueTitle: '',
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
}
