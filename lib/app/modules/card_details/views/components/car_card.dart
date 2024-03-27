import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';
import 'package:vroom_app/app/widgets/app_tile.dart';

import 'car_card_header.dart';
import 'car_spec_progress.dart';

class CarCard extends StatelessWidget {
  final CarModel car;
  final Function(CarModel)? onTap;
  final Function(CarModel)? onLongTap;

  const CarCard({Key? key, this.onTap, required this.car, this.onLongTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (onLongTap != null) onLongTap!(car);
      },
      onTap: () {
        if (onTap != null) onTap!(car);
      },
      child: Container(
    padding: EdgeInsets.all(10) ,
    decoration: BoxDecoration(
    color: AppColors.surface,

    borderRadius: BorderRadius.circular(20.r),
    ),
    child:
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'car-card-${car.hashCode}',
              child: Container(
                  width: 150,
                  child: AppNetworkImage(
                    url: car.image!,
                  )),
            ),
            SizedBox(height: 4),
            Text(
              car.model,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              car.make,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/money-dollar.png',
                  ),
                  SizedBox(width: 5),
                  Text(
                    car.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ),);
  }
}
