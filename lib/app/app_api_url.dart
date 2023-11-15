import 'dart:io';

import 'package:flutter/foundation.dart';

class AppApiUrl {
  static final root = 'https://vroom-api-6lt4pibyja-uc.a.run.app/';
  // kReleaseMode
  //     ?
  //     :
  // (Platform.isAndroid ? 'http://10.0.2.2/' : 'http://127.0.0.1/');
  static final rootUrl = '${root}api/';

  static const login = 'login';
  static const chanePasswordByFirebaseToken = 'auth/change-password';
  static const register = 'register';
  static const appSettings = 'app-settings';
  static const cars = 'cars';
  static const providers = 'providers';
  static const payments = 'payments';
  static const packages = 'packages';
  static const getUSer = 'user';
  static const forgotPassword = 'auth/forgot-password';
  static const users = 'users';
  static const imageUpload = 'uploader/media/upload';
  static final feed = 'feed';
  static final notifications = 'notifications';
  static const phoneExist = 'auth/phone-exist';
  //App Links Ops
  static final appLink = '${root}app-link';
}
