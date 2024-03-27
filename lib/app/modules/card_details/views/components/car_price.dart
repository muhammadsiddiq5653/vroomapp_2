import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class CarPrice extends StatelessWidget {
  const CarPrice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Remix.money_dollar_circle_fill,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Text('65,250 V-COINS',
            style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic))
      ],
    );
  }
}
