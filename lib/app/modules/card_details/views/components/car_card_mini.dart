import 'package:flutter/material.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/data/models/top_category_car_model.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../../helpers/hexcolor.dart';
import '../../../../widgets/app_network_image.dart';
import '../../../../widgets/app_text/text_400.dart';
import 'car_card_header.dart';
import 'car_price.dart';
import 'car_spec_progress.dart';

class CarCardMini extends StatelessWidget {
  final TopCategoryCarModel topCategoryCarModel;
  final Function(CarModel)? onTap;
  const CarCardMini({Key? key, this.onTap, required this.topCategoryCarModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(topCategoryCarModel.car);
      },
      child: AppTile(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 200, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text700(
                  text: topCategoryCarModel.categoryHeadLine,
                  animate: true,
                ),
                Text400(
                  text:
                      '${topCategoryCarModel.car.make} ${topCategoryCarModel.car.model} ${topCategoryCarModel.car.year}',
                ),
                SizedBox(
                  height: 20,
                ),
                CarSpecProgress(
                  value: topCategoryCarModel.percentage,
                  title: topCategoryCarModel.categoryHeadLine,
                  valueTitle:
                      '${topCategoryCarModel.value} ${topCategoryCarModel.unit}',
                ),
                SizedBox(
                  height: 20,
                ),
                CarPrice()
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              bottom: -40,
              child: Hero(
                tag: 'car-card-${topCategoryCarModel.car.id}',
                child: Container(
                    child: AppNetworkImage(
                  url:
                      "https://cdn.imagin.studio/getImage?customer=img&make=${topCategoryCarModel.car.make}&modelFamily=${topCategoryCarModel.car.model}&zoomType=fullscreen&width=200&angle=01",
                  width: 200,
                )),
              ))
        ]),
      ),
    );
  }
}
