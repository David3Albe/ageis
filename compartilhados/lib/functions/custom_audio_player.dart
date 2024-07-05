import 'package:dependencias_comuns/main.dart';
import 'package:flutter/services.dart';

class CustomAudioPlayer {
  static Player? player;
  static bool loaded = false;

  static Future playAudioFromAsset(String path) async {
    MediaKit.ensureInitialized();
    final audioData = await rootBundle.load('assets/$path');
    Media sound = await Media.memory(audioData.buffer.asUint8List());
    if (player == null) await initPlayer([sound]);
    if (loaded == true) await player?.open(sound, play: true);
  }

  static Future playAudiosFromAsset(List<String> paths) async {
    MediaKit.ensureInitialized();
    List<Media> medias = [];
    for (String path in paths) {
      final audioData = await rootBundle.load('assets/$path');
      Media sound = await Media.memory(audioData.buffer.asUint8List());
      medias.add(sound);
    }

    if (player == null) await initPlayer(medias);
    if (loaded == true) await player?.open(Playlist(medias), play: true);
  }

  static Future initPlayer(List<Media> sound) async {
    if (player != null) return;
    player = Player(
      configuration: PlayerConfiguration(
        title: 'AgeisCME',
        ready: () async {
          print('ready');
          await player!.setPlaylistMode(PlaylistMode.none);
          await player?.open(Playlist(sound), play: true);
          loaded = true;
        },
      ),
    );
  }
}
