import 'package:flutter/material.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import '../../../../helpers/hexcolor.dart';
import 'car_card_header.dart';
import 'car_price.dart';
import 'car_spec_progress.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final Function(CarModel)? onTap;
  const CarCard({Key? key, this.onTap, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!(car);
      },
      child: AppTile(
        child: Stack(children: [
          Positioned(
              left: -160,
              top: 0,
              bottom: -40,
              child: Hero(
                tag: 'car-card-${car.hashCode}',
                child: Container(
                    width: 400,
                    child: AppNetworkImage(
                      url:
                          "https://cdn.imagin.studio/getImage?customer=img&make=${car.make}&modelFamily=${car.model}&zoomType=fullscreen&width=300&angle=01",
                    )),
              )),
          Container(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CarCardHeader(car: car)),
              Container(
                padding: EdgeInsets.fromLTRB(220, 20, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CarSpecProgress(
                      value: AppUtilities.getWeightPercentage(car.enginePower),
                      title: 'Power',
                      valueTitle: '${car.enginePower} HP',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarSpecProgress(
                      value: AppUtilities.getWeightPercentage(car.weight),
                      title: 'Weight',
                      valueTitle: '${car.weight} KG',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarSpecProgress(
                      value:
                          AppUtilities.getCityMilagePercentage(car.cityMilage),
                      title: 'City Milage',
                      valueTitle: '${car.cityMilage} KM/L',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
