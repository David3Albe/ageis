import 'package:dependencias_comuns/main.dart';

class CustomAudioPlayer {
  static void playAudioFromAsset(String path) {
    final player = AudioPlayer();
    player.play(AssetSource(path));
  }
}
