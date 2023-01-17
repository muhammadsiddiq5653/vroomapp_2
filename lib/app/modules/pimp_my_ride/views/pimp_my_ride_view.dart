import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vroom_app/app/widgets/app_bars/inside_app_bar.dart';

import '../controllers/pimp_my_ride_controller.dart';

class PimpMyRideView extends GetView<PimpMyRideController> {
  const PimpMyRideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InsideAppBar(
        title: '',
      ),
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 1, end: 2),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInExpo,
              builder: (BuildContext context, double value, Widget? child) {
                return Transform.rotate(
                  angle: pi / value,
                  child: Hero(
                    tag: 'car-card-1',
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "assets/images/car.png",
                          height: 200,
                        )),
                  ),
                );
              },
              child: const Icon(Icons.aspect_ratio),
            ),
          ]),
    );
  }
}
