import 'package:vroom_app/app/data/models/serializable.dart';
import 'package:vroom_app/app/data/models/user_model.dart';

class FeedCommentModel extends Serializable {
  int id = 0;
  String description = '';
  UserModel? userModel;
  DateTime createdAt = DateTime.now();
  FeedCommentModel(
      {this.id = 0,
      required this.description,
      required this.createdAt,
      required this.userModel});

  FeedCommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'] ?? '';
    createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();

    if (json['user'] != null) {
      userModel = UserModel.fromJson(json['user']);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'description': description};
  }
}
