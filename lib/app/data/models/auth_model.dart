import 'user_model.dart';

class AuthModel {
  late String accessToken;
  late UserModel userModel;

  AuthModel({
    required this.accessToken,
    required this.userModel,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    userModel = UserModel.fromJson(json);
  }
}
