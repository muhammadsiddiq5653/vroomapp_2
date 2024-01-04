import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vroom_app/app/app_utilities.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../app_enums.dart';
import '../../../data/api/app_feed_api.dart';
import '../../../data/models/envelope_model.dart';
import '../../../data/models/feed_model.dart';
import '../../../routes/app_pages.dart';

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
      loadingState = GeneralLoadingState.empty;
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

  like(FeedModel feed) async {
    try {
      appFeedApi.like(feed);
      feed.liked = !feed.liked;
      if (feed.liked) {
        feed.likes++;
      } else {
        feed.likes--;
      }
      if (feed.likes < 0) {
        feed.likes = 0;
      }
      update();
    } catch (ex) {
      print(ex);
      dialogService.showError(ex);
    } finally {}
  }

  delete(FeedModel feed) async {
    try {
      appFeedApi.delete(feed.id);
      // appFeedApi.like(feed);
      // feed.liked = !feed.liked;
      // if (feed.liked) {
      //   feed.likes++;
      // } else {
      //   feed.likes--;
      // }
      // if (feed.likes < 0) {
      //   feed.likes = 0;
      // }
      update();
    } catch (ex) {
      print(ex);
      dialogService.showError(ex);
    } finally {}
  }

  share(FeedModel feed, Uint8List? bytes) async {
    try {
      loadingState = GeneralLoadingState.waiting;
      AppUtilities.share(bytes);
      loadingState = GeneralLoadingState.done;
      await appFeedApi.share(feed);
      feed.shares++;
      update();
    } catch (ex) {
      print(ex);
      dialogService.showError(ex);
    } finally {
      loadingState = GeneralLoadingState.done;
    }
  }

  void scanCar() async {
    await Get.toNamed(Routes.SCAN_CAR);
  }
}
