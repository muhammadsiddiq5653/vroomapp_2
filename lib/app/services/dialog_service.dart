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
      Get.snackbar('Oops!', error,
          backgroundColor: AppColors.error, colorText: AppColors.onError);
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
        backgroundColor: AppColors.error, colorText: AppColors.onError);
  }

  void showInfo(message, {title = 'Wroom', onTap}) {
    Get.snackbar(title, message,
        backgroundColor: AppColors.primary,
        colorText: Colors.white, onTap: (_) {
      try {
        onTap();
      } catch (ex, stack) {
        captureException(ex, stackTrace: stack);
      }
    });
  }

  Future<bool> showConfirm(String message,
      {String? title, bool alternate = false, String? confirmText}) async {
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
                    if (alternate)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppButtonField(
                            onPressed: () {
                              Get.back(result: true);
                            },
                            text: confirmText ?? 'I understand',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Get.back(result: false);
                              }),
                        ],
                      ),
                    if (!alternate)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.back(result: true);
                              },
                              child: Text(
                                'I understand',
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          AppButtonField(
                              text: 'Cancel',
                              onPressed: () {
                                Get.back(result: false);
                              }),
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        ))) ??
        false;
  }
}
