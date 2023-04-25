import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/data/models/serializable.dart';
import 'package:vroom_app/app/data/models/user_model.dart';

class CarModel extends Serializable {
  int? id;
  int? userCardId;
  late String make;
  late String model;
  late int year;
  int? weight;
  double? cityMilage;
  int? enginePower;
  double? price;
  String? logo;
  UserModel? user;
  String? image;
  CarModel({
    required this.make,
    required this.id,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCardId = json['user_car_id'];
    make = json['make'];
    model = json['model'];
    year = json['year'];
    weight = AppUtilities.ensureInt(json['weight']);
    cityMilage = AppUtilities.ensureDouble(json['city_milage']);
    enginePower = AppUtilities.ensureInt(json['engine_power']);
    price = AppUtilities.ensureDouble(json['price']);
    logo = json['logo'];
    user = UserModel.fromJson(json['user']);
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_car_id'] = this.userCardId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['year'] = this.year;
    data['weight'] = this.weight;
    data['city_milage'] = this.cityMilage;
    data['engine_power'] = this.enginePower;
    data['price'] = this.price;
    data['logo'] = this.logo;
    return data;
  }
}
