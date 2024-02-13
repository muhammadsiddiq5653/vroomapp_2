import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PreviewController extends GetxController {
  int pageIndex = 0;

  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    videoPlayerController = VideoPlayerController.asset('assets/welcomeVideo.mp4');
    videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      videoPlayerController.setVolume(0);
      videoPlayerController.setLooping(true);
    });
    super.onInit();
  }

    @override
  void dispose() {
    // TODO: implement dispose
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
