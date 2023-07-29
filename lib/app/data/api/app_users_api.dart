import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import '../../app_api_url.dart';
import '../../app_constants.dart';
import '../../services/network_service.dart';
import '../models/envelope_model.dart';
import '../models/user_model.dart';

class AppUsersApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<UserModel> edit(UserModel model) async {
    var result = await networkService.put('${AppApiUrl.users}/${model.id}',
        data: model.toJson());
    return UserModel.fromJson(result.data);
  }

  Future<UserModel> getOne(int userId) async {
    var result = await networkService.get(
      '${AppApiUrl.users}/$userId',
    );
    return UserModel.fromJson(result.data);
  }

  Future<bool> addToken(String fcmToken, int userId) async {
    await networkService
        .put('${AppApiUrl.users}/$userId', data: {'firebase_token': fcmToken});
    return true;
  }

  Future<bool> verify(int userId) async {
    await networkService.put('${AppApiUrl.users}/$userId/verify', data: {
      'token': sha512
          .convert(utf8.encode(userId.toString() + AppConstants.hasher))
          .toString()
    });
    return true;
  }

  Future<bool> changePassword(
      int userId, String old, String newPassword) async {
    await networkService
        .put('${AppApiUrl.users}/$userId/change-password', data: {
      'old_password': old,
      'new_password': newPassword,
      'confirm_password': newPassword
    });
    return true;
  }

  Future<bool> toggleFollow(int userId) async {
    await networkService.put('${AppApiUrl.users}/$userId/follow');
    return true;
  }

  Future<bool> saveAreas(int userId, List<int> areas) async {
    await networkService
        .post('${AppApiUrl.users}/$userId/areas', data: {'areas': areas});
    return true;
  }

  Future<EnvelopeModel<UserModel>> getAll(
      {page = 1, String? search, required int type}) async {
    var result = await networkService
        .get('${AppApiUrl.users}', query: {'page': page, 'search': search});
    print(result.requestOptions.uri);
    return EnvelopeModel<UserModel>.fromJson(result.data, (data) {
      var users = <UserModel>[];
      data.forEach((value) {
        users.add(UserModel.fromJson(value));
      });
      return users;
    });
  }

  Future<bool> changePhone(userId, String? phone, String? phoneCode) async {
    await networkService.put('${AppApiUrl.users}/$userId', data: {
      'phone': phone,
      'phone_code': phoneCode,
    });
    return true;
  }
}
