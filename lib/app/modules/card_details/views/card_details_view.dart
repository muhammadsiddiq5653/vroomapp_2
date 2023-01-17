import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/custom_painter/app_message_bubble.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';
import 'package:vroom_app/app/widgets/app_form_fields/app_button_field.dart';
import 'package:vroom_app/app/widgets/app_text/big_header_text.dart';

import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_600.dart';
import '../controllers/card_details_controller.dart';
import 'components/car_card_header.dart';
import 'components/car_price.dart';
import 'components/car_spec_progress.dart';

class CardDetailsView extends GetView<CardDetailsController> {
  final controller = Get.put(CardDetailsController());
  CardDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InsideAppBar(title: ''),
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 170, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CarCardHeader(
                          car: controller.car,
                        ),
                        if (false)
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.PIMP_MY_RIDE);
                            },
                            child: Column(
                              children: [
                                ShakeWidget(
                                  duration: Duration(seconds: 10),
                                  shakeConstant: ShakeRotateConstant1(),
                                  autoPlay: true,
                                  enableWebMouseHover: true,
                                  child: CustomPaint(
                                      painter: AppMessageBubble(),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        height: 38,
                                        width: 114,
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text400(text: 'pimp your ride'),
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 45,
                                  height: 45,
                                  child: AppButtonField(
                                    prefix: Icon(
                                      Remix.vip_diamond_line,
                                      size: 12,
                                      color: AppColors.primary,
                                    ),
                                    text: '',
                                    textColor: AppColors.primary,
                                    onPressed: () {},
                                    primary: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CarSpecProgress(
                      value: AppUtilities.getWeightPercentage(
                          controller.car.enginePower),
                      title: 'Power',
                      valueTitle: '${controller.car.enginePower} HP',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarSpecProgress(
                      value: AppUtilities.getWeightPercentage(
                          controller.car.weight),
                      title: 'Weight',
                      valueTitle: '${controller.car.weight} KG',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarSpecProgress(
                      value: AppUtilities.getCityMilagePercentage(
                          controller.car.cityMilage),
                      title: 'City Milage',
                      valueTitle: '${controller.car.cityMilage} KM/L',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarPrice(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        BigHeaderText(text: 'Other details'),
                        Icon(
                          Remix.information_line,
                          size: 23,
                          color: Colors.white,
                        )
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
                          text: controller.car.make,
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
                          text: controller.car.model,
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
                          text: controller.car.year.toString(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                    // Text400(
                    //   text:
                    //       'The Honda NSX, marketed in North America as the Acura NSX, is a two-seat, mid-engined coupe sports car manufactured by Honda.',
                    //   fontSize: 14,
                    // ),
                  ],
                ),
              ),
              Positioned(
                  right: -230,
                  top: 0,
                  bottom: 0,
                  child: Hero(
                    tag: 'car-card-1',
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "assets/images/car.png",
                        )),
                  ))
            ]),
          ),
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(30, 20, 40, 20),
            child: AppButtonField(
              text: 'Battle now'.toUpperCase(),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
