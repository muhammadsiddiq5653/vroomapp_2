import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_colors.dart';
import '../app_exception.dart';

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
}
