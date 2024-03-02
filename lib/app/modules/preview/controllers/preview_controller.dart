import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../services/sound_service.dart';

class PreviewController extends GetxController {

  int pageIndex = 0;

  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('assets/welcomeVideo.mp4');

  @override
  void onInit() {
    videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setVolume(0);
      videoPlayerController.setLooping(true);
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPageIndex(int val) {
    pageIndex = val;
    update();
  }
}
