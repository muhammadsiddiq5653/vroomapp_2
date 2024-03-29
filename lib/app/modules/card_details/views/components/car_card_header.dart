import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/helpers/hexcolor.dart';
import 'package:vroom_app/app/widgets/app_network_image.dart';
import 'package:vroom_app/app/widgets/app_text/text_400.dart';

class CarCardHeader extends StatelessWidget {
  final CarModel car;
  const CarCardHeader({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor("#131316")),
          padding: EdgeInsets.all(3),
          child: AppNetworkImage(
            url: car.logo.toString(),
            width: 32.w,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.model,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800),
            ),
            Text400(
              text: car.make + " | " + car.year.toString(),
              fontSize: 14.sp,
            ),
          ],
        ),
      ],
    );
  }
}
