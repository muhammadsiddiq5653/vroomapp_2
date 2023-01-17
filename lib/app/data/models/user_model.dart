import 'serializable.dart';

class UserModel extends Serializable {
  String? avatar;
  String? name;
  String email = '';
  String? password;
  String? phone;
  String? phoneCode;
  int? id;
  String? firebaseToken;
  bool phoneVerified = false;
  UserModel({
    this.id,
    this.avatar,
    this.name,
    this.phoneVerified = false,
    required this.email,
    this.firebaseToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerified = json['phone_verified_at'] != null;
    phoneCode = json['phone_code'];
    firebaseToken = json['firebase_token'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['phone_code'] = phoneCode;
    data['email'] = email;

    if (password != null) {
      data['password'] = password;
    }
    if (firebaseToken != null) {
      data['firebase_token'] = firebaseToken;
    }
    return data;
  }
}
