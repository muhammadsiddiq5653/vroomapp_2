import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';

import '../../../app_colors.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: AppStateHandler(
          loadingState: controller.loadingState,
          onRetry: controller.init,
          child: _getView(context),
          loadingWidget: _getView(context),
        ),
      ),
    );
  }

  Container _getView(BuildContext context) {
    if (controller.forceUpdateView == true) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Remix.upload_line,
              color: AppColors.primary,
              size: 150,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Hurrayyy!!\n\nWroom have new exciting update click the button to update now',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 200,
              height: 50,
              child: AppButtonField(
                  text: 'Update now',
                  onPressed: () {
                    LaunchReview.launch(
                        iOSAppId: '1665912517', writeReview: false);
                  }),
            )
          ],
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment(1, 0.2),
        //   colors: [
        //     Color(0XFF3E3D41),
        //     Color(0XFF0D0D0F),
        //   ],
        // ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logo(),
          versionText(),
        ],
      ),
    );
  }

  Widget versionText() {
    return Column(
      children: [
        Text(
          'Version ${controller.version} ${controller.buildNumber} ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              fontFamily: 'Exo 2',
              color: Colors.white),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  Widget logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/images/splashicon.png',
            width: 230,
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/wroom.png',
            width: 180,
          ),
        ],
      ),
    );
  }
}
