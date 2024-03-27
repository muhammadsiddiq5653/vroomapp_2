import 'package:vroom_app/app/app_utilities.dart';

import 'serializable.dart';

class UserModel extends Serializable {
  String? avatar;
  String? name;
  String? username;
  String? favoriteCarBrand;
  String? email = '';
  String? password;
  String? phone;
  String? phoneCode;
  String? wrooms;
  String? posts;
  int? id;
  String? firebaseToken;
  bool phoneVerified = false;
  String? media;
  double? totalPrice = 0;
  UserModel({
    this.id,
    this.avatar,
    this.name,
    this.username,
    this.favoriteCarBrand,
    this.phoneVerified = false,
    required this.email,
    this.firebaseToken,
    this.wrooms,
    this.posts,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    wrooms = json['wrooms'];
    posts = json['posts'];
    username = json['username'];
    favoriteCarBrand = json['favoriteCarBrand'];
    email = json['email'];
    phone = json['phone'];
    phoneVerified = json['phone_verified_at'] != null;
    phoneCode = json['phone_code'];
    firebaseToken = json['firebase_token'];
    totalPrice = AppUtilities.ensureDouble(json['total_price']);
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (username != null) data['username'] = username;
    if (favoriteCarBrand != null) data['favoriteCarBrand'] = favoriteCarBrand;
    if (phone != null) data['phone'] = phone;
    if (phoneCode != null) data['phone_code'] = phoneCode;
    if (email?.isNotEmpty == true) data['email'] = email;

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
