import 'dart:io';
import 'package:get/get.dart';

import '../../app_api_url.dart';
import '../../services/network_service.dart';
import '../models/auth_model.dart';
import '../models/user_model.dart';

class AuthApi extends GetxService {
  final NetworkService networkService = Get.put(NetworkService());

  Future<AuthModel> signInWithPhonePassword(
      String phone, String password) async {
    var response = await networkService
        .post(AppApiUrl.login, data: {'phone': phone, 'password': password});
    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> signInWithtoken(String accessToken) async {
    var response = await networkService.get(AppApiUrl.getUSer,
        headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"});
    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> signUp(UserModel user) async {
    var response =
        await networkService.post(AppApiUrl.register, data: user.toJson());
    return AuthModel.fromJson(response.data);
  }

  Future<bool> forgotPassword(String email) async {
    await networkService.post(AppApiUrl.forgotPassword, data: {
      "email": email,
    });
    return true;
  }
}
