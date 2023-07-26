import 'package:get/get.dart';

import '../../app_api_url.dart';
import '../../services/network_service.dart';
import '../models/envelope_model.dart';
import '../models/feed_comment_model.dart';
import '../models/feed_model.dart';

class AppFeedApi extends GetxService {
  var networkService = Get.put(NetworkService());

  Future<FeedModel> add(FeedModel feed) async {
    var result = await networkService.post(AppApiUrl.feed, data: feed.toJson());
    return FeedModel.fromJson(result.data);
  }

  Future<EnvelopeModel<FeedModel>> getAll({page = 1, userId = null}) async {
    var query = {'page': page};
    if (userId != null) {
      query['user_id'] = userId;
    }
    var result = await networkService.get(AppApiUrl.feed, query: query);
    return EnvelopeModel<FeedModel>.fromJson(result.data, (data) {
      var feeds = <FeedModel>[];
      data.forEach((value) {
        feeds.add(FeedModel.fromJson(value));
      });
      return feeds;
    });
  }

  Future<bool> delete(int id) async {
    await networkService.delete('${AppApiUrl.feed}/$id');
    return true;
  }

  Future<bool> edit(FeedModel feed) async {
    await networkService.put('${AppApiUrl.feed}/${feed.id}',
        data: feed.toJson());
    return true;
  }

  Future<bool> like(FeedModel feed) async {
    await networkService.put('${AppApiUrl.feed}/${feed.id}/like',
        data: feed.toJson());
    return true;
  }

  Future<FeedModel> get(int id) async {
    var result = await networkService.get('${AppApiUrl.feed}/$id');
    return FeedModel.fromJson(result.data);
  }

  Future<EnvelopeModel<FeedCommentModel>> getAllComments(feedId,
      {page = 1}) async {
    var query = {'page': page};
    var result = await networkService.get('${AppApiUrl.feed}/$feedId/comments',
        query: query);
    return EnvelopeModel<FeedCommentModel>.fromJson(result.data, (data) {
      var feeds = <FeedCommentModel>[];
      data.forEach((value) {
        feeds.add(FeedCommentModel.fromJson(value));
      });
      return feeds;
    });
  }

  Future<FeedCommentModel> addComment(
      feedId, FeedCommentModel commentModel) async {
    var result = await networkService.post('${AppApiUrl.feed}/$feedId/comments',
        data: commentModel.toJson());
    return FeedCommentModel.fromJson(result.data);
  }

  Future<void> deleteComment(int feedID, int id) async {
    var result = await networkService.delete(
      '${AppApiUrl.feed}/$feedID/comments/$id',
    );
    return;
  }
}
