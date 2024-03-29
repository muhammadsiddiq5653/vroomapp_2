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
        .post(AppApiUrl.login, data: {'username': phone, 'password': password});
    if (response.data['name'] == '(deleted user)')
      throw Exception('This Account has been deleted');
    else {
      return AuthModel.fromJson(response.data);
    }
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

  Future<bool> userNameExist(String userName) async {
    try {
      await networkService.post(AppApiUrl.usernameExist, data: {
        'username': userName,
      });
      return true;
    } catch (ex) {
      return false;
    }
  }

  Future<bool> resetPasswordByFirebaseToken(
      String password, String firebaseToken) async {
    await networkService.post(AppApiUrl.chanePasswordByFirebaseToken,
        data: {'password': password, 'firebase_token': firebaseToken});
    return true;
  }
}
