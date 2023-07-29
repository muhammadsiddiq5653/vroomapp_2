import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SoundService extends GetxService {
  final effectPlayer = AudioPlayer();

  @override
  onReady() async {
    super.onReady();
  }

  playEngineIgnition() async {
    await effectPlayer.play(AssetSource('sounds/engineignition.wav'));
  }

  playclick() async {
    // await effectPlayer.play(AssetSource('sounds/click.wav'));
  }
}
