import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vroom_app/app/data/api/app_feed_api.dart';
import 'package:vroom_app/app/data/models/envelope_model.dart';
import 'package:vroom_app/app/data/models/feed_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/services/create_image_service.dart';

import '../../../app_enums.dart';

class FeedController extends AppAbstractController {
  AppFeedApi appFeedApi = Get.put(AppFeedApi());
  CreateImageService createImageService = Get.put(CreateImageService());
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

  share(FeedModel feed, Uint8List? bytes) async {
    try {
      showLoading();
      final file = File(
          '${(await getTemporaryDirectory()).path}/${DateTime.now().toIso8601String().replaceAll('.', '-')}.png');
      await file.create(recursive: true);
      File path = await file.writeAsBytes(bytes!);
      await Share.shareFiles([path.path], text: 'Check it out in Wroom App');
      hideLoading();
      await appFeedApi.share(feed);
      feed.shares++;
      update();
    } catch (ex) {
      print(ex);
      dialogService.showError(ex);
    } finally {
      hideLoading();
    }
  }
}
