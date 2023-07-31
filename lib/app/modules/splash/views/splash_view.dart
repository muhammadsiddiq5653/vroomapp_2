import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/widgets/app_state_handler.dart';
import 'package:launch_review/launch_review.dart';
import 'package:vroom_app/app/widgets/app_text/small_bold_text.dart';
import 'package:vroom_app/app/widgets/app_text/text_700.dart';
import '../../../app_colors.dart';
import '../../../widgets/app_form_fields/app_button_field.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: AppStateHandler(
          loadingState: controller.loadingState,
          onRetry: controller.init,
          child: _getView(),
          loadingWidget: _getView(),
        ),
      ),
    );
  }

  Container _getView() {
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 40,
            ),
            AppButtonField(
                text: 'Update now',
                onPressed: () {
                  LaunchReview.launch(
                      iOSAppId: '1665912517', writeReview: false);
                })
          ],
        ),
      );
    }
    return Container(
      color: AppColors.primary,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splashicon.png',
            width: 230,
          ),
          SizedBox(
            height: 20,
          ),
          Text700(text: 'Wroom', color: Colors.white, fontSize: 50),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
