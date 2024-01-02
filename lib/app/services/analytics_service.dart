import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../app_exception.dart';
import '../data/models/auth_model.dart';

class AnalyticsService extends GetxService {
  void logLogin() {
    try {
      FirebaseAnalytics.instance.logLogin();
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void logSignup() {
    try {
      FirebaseAnalytics.instance.logSignUp(signUpMethod: 'Normal');
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void logUser(AuthModel authModel) {
    try {
      FirebaseAnalytics.instance
          .setUserProperty(name: 'name', value: authModel.userModel.name);
      FirebaseAnalytics.instance
          .setUserProperty(name: 'email', value: authModel.userModel.email);
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }
}
