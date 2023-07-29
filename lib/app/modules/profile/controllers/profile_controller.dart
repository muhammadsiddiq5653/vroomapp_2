import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../app_enums.dart';
import '../../../data/api/app_feed_api.dart';
import '../../../data/models/envelope_model.dart';
import '../../../data/models/feed_model.dart';

class ProfileController extends AppAbstractController {
  AppFeedApi appFeedApi = Get.put(AppFeedApi());
  EnvelopeModel<FeedModel>? feed;
  int direction = 0;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    scrollController.addListener(onScroll);
    super.onReady();
    loadFeed();
  }

  @override
  void onClose() {
    scrollController.removeListener(onScroll);
    super.onClose();
  }

  Future<bool> loadFeed({int page = 1}) async {
    try {
      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appFeedApi.getAll(
          page: page, userId: settingsService.authModel?.userModel.id);
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

  void onScroll() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (direction == 0) return;
      setDirection(0);
    } else {
      if (direction == 1) return;
      setDirection(1);
    }
  }

  void setDirection(int i) {
    direction = i;
    update();
  }

  like(FeedModel p1) {}

  share(FeedModel p1) {
    Share.share('check out my website https://example.com');
  }
}
