import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/helpers/widgets_to_image_controller.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:vroom_app/app/widgets/app_text/big_header_text.dart';
import 'package:vroom_app/app/widgets/widgets_to_image.dart.dart';

import '../../../widgets/app_network_image.dart';
import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_600.dart';
import '../controllers/card_details_controller.dart';
import 'components/car_card_header.dart';
import 'components/car_spec_progress.dart';

class CardDetailsView extends GetView<CardDetailsController> {
  final controller = Get.put(CardDetailsController());
  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();

  CardDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardDetailsController>(
      builder: (_) => Scaffold(
        body: SafeArea(
          child: AppStateHandler(
            loadingState: controller.loadingState,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 45.0, horizontal: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/images/svg/BackIcon.svg",
                          width: 42,
                          height: 42,
                        )),
                      ),
                      // controller.isLoggedin.value ?
                      //    Theme(
                      //         data: Theme.of(context).copyWith(
                      //           cardColor: Colors.black,
                      //         ),
                      //         child: PopupMenuButton<int>(
                      //           // color: Colors.white,
                      //           icon: Icon(
                      //             Remix.more_fill,
                      //             color: Colors.white,
                      //           ),
                      //           initialValue: null,
                      //           // Callback that sets the selected popup menu item.
                      //           onSelected: (value) async {
                      //             if (value == 0) {
                      //               controller.shareOutsideApp(
                      //                   await widgetsToImageController
                      //                       .capture());
                      //             } else if (value == 1) {
                      //               controller.deleteCar();
                      //             }
                      //           },
                      //           itemBuilder: (BuildContext context) =>
                      //               <PopupMenuEntry<int>>[
                      //             PopupMenuItem<int>(
                      //               value: 0,
                      //               child: Row(
                      //                 children: [
                      //                   Icon(
                      //                     Remix.share_fill,
                      //                     color: Colors.white,
                      //                     size: 16,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 10,
                      //                   ),
                      //                   Text400(
                      //                     text: 'Share this car',
                      //                     color: Colors.white,
                      //                     fontSize: 16,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             PopupMenuItem<int>(
                      //               value: 1,
                      //               child: Row(
                      //                 children: [
                      //                   Icon(
                      //                     Remix.delete_bin_fill,
                      //                     color: Colors.white,
                      //                     size: 16,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 10,
                      //                   ),
                      //                   Text400(
                      //                     text: 'Delete this car',
                      //                     color: Colors.white,
                      //                     fontSize: 16,
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ) :
                      // SizedBox.shrink()
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CarCardHeader(
                                  car: controller.car ??
                                      CarModel(make: '-', id: 1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Hero(
                              tag: 'car-card-${controller.car.hashCode}',
                              child: Container(
                                  width: double.infinity,
                                  child: AppNetworkImage(
                                    url: controller.car?.image ?? '',
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CarSpecProgress(
                              value: AppUtilities.getPricePercentage(
                                  controller.car?.price),
                              title: 'Price',
                              valueTitle:
                                  '${controller.car?.price?.truncate()} \$',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CarSpecProgress(
                              value: AppUtilities.getPowerPercentage(
                                  controller.car?.enginePower),
                              title: 'Power',
                              valueTitle: '${controller.car?.enginePower} HP',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CarSpecProgress(
                              value: AppUtilities.getWeightPercentage(
                                  controller.car?.weight),
                              title: 'Weight',
                              valueTitle: '${controller.car?.weight} KG',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CarSpecProgress(
                              value: AppUtilities.getCityMilagePercentage(
                                  controller.car?.cityMilage),
                              title: 'City Milage',
                              valueTitle: '${controller.car?.cityMilage} KM/L',
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BigHeaderText(text: 'Other details'),
                                // Icon(
                                //   Remix.information_line,
                                //   size: 23,
                                //   color: Colors.white,
                                // )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text400(
                                  text: 'Make',
                                  fontSize: 14,
                                ),
                                Text600(
                                  text: controller.car?.make ?? '',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text400(
                                  text: 'Model',
                                  fontSize: 14,
                                ),
                                Text600(
                                  text: controller.car?.model ?? '',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text400(
                                  text: 'Year',
                                  fontSize: 14,
                                ),
                                Text600(
                                  text: controller.car?.year.toString() ?? '',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (controller.isLoggedin.value)
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.fromLTRB(30, 20, 40, 20),
                    child: AppButtonField(
                      text:  controller.checkIfLoggedInUserPost() ? 'share on the feed' :'share with friends',
                      onPressed: () async {
                        if (controller.checkIfLoggedInUserPost()) {
                          controller.shareCar();
                        } else {
                          controller.shareOutsideApp(
                              await widgetsToImageController.capture());
                        }
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
