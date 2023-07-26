import 'package:vroom_app/app/data/models/serializable.dart';

typedef ItemCreator<S> = S Function();

class EnvelopeModel<T extends Serializable> {
  List<T> collection = [];
  int total = 0;
  bool haveNext = false;
  int currentPage = 1;
  bool isEmpty() {
    return collection.isEmpty;
  }

  EnvelopeModel(
      {required this.collection,
      this.total = 0,
      this.haveNext = false,
      this.currentPage = 1});

  EnvelopeModel.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) {
    var data = create(json['data']);
    total = json['total'] ?? 0;
    haveNext = json['next_page_url'] == null ? false : true;
    currentPage = json['current_page'] ?? 1;
    collection = data;
  }
}
