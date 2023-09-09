import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../app_exception.dart';
import '../widgets/app_bottom_sheet.dart';
import '../widgets/app_form_fields/app_button_field.dart';

class DialogService extends GetxService {
  void showError(error) {
    if (error is String) {
      Get.snackbar(
        'Oops!',
        error,
        backgroundColor: Color(0xFFFB0540),
        colorText: AppColors.onError,
      );
      return;
    }
    var message = error.toString();
    try {
      if (error.message != null) message = error.message;
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
      if (kReleaseMode) message = 'Unexpected error occured';
    }
    Get.snackbar('Oops!', message,
        backgroundColor: Color(0xFFFB0540), colorText: AppColors.onError);
  }

  void showInfo(message, {title = 'Wroom', onTap}) {
    Get.snackbar(title, message,
        backgroundColor: Color(0xFF00C969),
        colorText: Colors.white, onTap: (_) {
      try {
        onTap();
      } catch (ex, stack) {
        captureException(ex, stackTrace: stack);
      }
    });
  }

  Future<bool> showConfirm(String message,
      {String? title, String? confirmText}) async {
    return (await Get.bottomSheet(AppBottomSheet(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: [
                Column(
                  children: [
                    Text(
                      title ?? 'Are you sure?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(message,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: AppButtonField(
                            primary: AppColors.primary,
                            onPressed: () {
                              Get.back(result: true);
                            },
                            text: (confirmText ?? 'I understand').toUpperCase(),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            height: 50,
                            child: AppButtonField(
                                primary: Colors.transparent,
                                text: 'Cancel',
                                onPressed: () {
                                  Get.back(result: false);
                                }))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ))) ??
        false;
  }
}
