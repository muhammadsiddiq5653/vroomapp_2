import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/data/models/serializable.dart';
import 'package:vroom_app/app/data/models/user_model.dart';

class FeedModel extends Serializable {
  int id = 0;
  String? cover = '';
  String? description;
  UserModel? userModel;
  String? image;
  String? video;
  int likes = 1;
  CarModel? carModel;
  bool liked = false;
  int comments = 1;
  DateTime createdAt = DateTime.now();
  int shares = 1;
  int userCarId = 1;
  FeedModel(
      {this.id = 0,
      required this.description,
      required this.cover,
      required this.createdAt,
      this.comments = 1,
      this.liked = false,
      this.likes = 1,
      this.shares = 1,
      this.image,
      this.carModel,
      this.userModel,
      this.userCarId = 1});
  FeedModel.clone(FeedModel feedModel)
      : this(
            id: feedModel.id,
            cover: feedModel.cover,
            description: feedModel.description,
            createdAt: feedModel.createdAt,
            comments: feedModel.comments,
            liked: feedModel.liked,
            likes: feedModel.likes,
            userModel: feedModel.userModel);

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likes = json['likes'] ?? 1;
    shares = json['shares'] ?? 1;
    comments = json['comments'] ?? 1;
    image = json['image'];
    liked = json['liked'] ?? false;
    description = json['description'];
    userCarId = json['user_car_id'];
    if (json['user'] != null) {
      userModel = UserModel.fromJson(json['user']);
    }

    if (json['user_car'] != null) {
      carModel = CarModel.fromJson(json['user_car']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {'user_car_id': carModel?.userCardId};
  }
}
