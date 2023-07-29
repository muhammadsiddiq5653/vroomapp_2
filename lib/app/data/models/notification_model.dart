import 'serializable.dart';

class NotificationModel extends Serializable {
  late String message;
  late String? directLink;
  late String? image;
  late DateTime? createdAt;
  NotificationModel(
      {required this.message, this.directLink, this.image, this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    directLink = json['direct_link'];
    image = json['image'];
    createdAt = DateTime.tryParse(json['created_at']) ?? DateTime.now();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
