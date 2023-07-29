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
  String? media;
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
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (phone != null) data['phone'] = phone;
    if (phoneCode != null) data['phone_code'] = phoneCode;
    if (email.isNotEmpty) data['email'] = email;

    if (password != null) {
      data['password'] = password;
    }
    if (firebaseToken != null) {
      data['firebase_token'] = firebaseToken;
    }
    if (media != null) {
      data['media'] = media;
    }
    return data;
  }
}
