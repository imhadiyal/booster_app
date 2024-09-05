import 'package:assets_audio_player/assets_audio_player.dart';

class MyAudioController {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;
  bool plays = false;
  myAudioController() {
    init();
  }

  Future<void> init() async {
    await audioPlayer
        .open(
      Audio("lib/assets/audios/Yaad.mp3"),
      autoStart: false,
    )
        .then(
      (val) {
        duration = audioPlayer.current.value!.audio.duration;
      },
    );
  }

  Future<void> play() async {
    await audioPlayer.play();
    plays = true;
  }

  Future<void> push() async {
    await audioPlayer.pause();
    plays = false;
  }

  Future<void> seek({required int second}) async {
    await audioPlayer.seek(
      Duration(seconds: second),
    );
  }
}
