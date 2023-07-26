import 'package:get/get.dart';
import 'package:vroom_app/app/data/api/app_feed_api.dart';
import 'package:vroom_app/app/data/models/envelope_model.dart';
import 'package:vroom_app/app/data/models/feed_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../app_enums.dart';

class FeedController extends AppAbstractController {
  AppFeedApi appFeedApi = Get.put(AppFeedApi());
  EnvelopeModel<FeedModel>? feed;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadFeed();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> loadFeed({int page = 1}) async {
    try {
      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appFeedApi.getAll(page: page);
      if (page == 1) {
        feed = result;
        if ((feed?.collection.length ?? 0) == 0) {
          loadingState = GeneralLoadingState.empty;
        } else {
          loadingState = GeneralLoadingState.done;
        }
      } else {
        feed!.haveNext = result.haveNext;
        feed!.currentPage = result.currentPage;
        feed!.collection.addAll(result.collection);
      }
      return true;
    } catch (ex) {
      print(ex);
      loadingState = GeneralLoadingState.error;
      return false;
    } finally {
      update();
    }
  }
}
