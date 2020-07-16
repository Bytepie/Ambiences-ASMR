import 'package:assets_audio_player/assets_audio_player.dart';
import 'audiolist.dart';

//bool mixin = false;

class AudioModel {
//  static var assetsAudioPlayer = AssetsAudioPlayer.allPlayers();
  int length = 0;
  List<Audio> audioPlaylist = [];
  static bool mixin = false;
  static var player = [];
  void playAsmrRandom(int listNumber, String category) {
//    var assetsAudioPlayer = AssetsAudioPlayer();
//    assetsAudioPlayer.
    //Random random = new Random();
    if (!mixin) {
      audioPlaylist.clear();
    }

    for (var sound in audiolist[category][listNumber]['sounds']) {
      print(sound);
      var audio = Audio(sound.toString(),
          metas: Metas(
              title: "Mystic",
              image: MetasImage.asset('assets/images/nc.png')));
      audioPlaylist.add(audio);
    }

//    for (int i = 0; i < length; i++) {
//      var audio = Audio(audiolist[category][listNumber]['sounds'],
//          metas: Metas(
//              title: "Mystic",
//              image: MetasImage.asset('assets/images/nc.png')));
////      print('What is this sorcery' +' ' +audioList['asmr_sounds'][asmrAlbum][i].toString());
//      audioPlaylist.add(audio);
//    }
    print(audioPlaylist);
    player.add(AssetsAudioPlayer.withId('0'));
    player[0].open(Playlist(audios: audioPlaylist),
        showNotification: true,
        notificationSettings: NotificationSettings(
          prevEnabled: false,
          playPauseEnabled: false,
          nextEnabled: false,
        ));

    player[0].shuffle = true;
    player[0].loop = true;
    player[0].play();
//    print(player[0].withId('0').toString());

//    AssetsAudioPlayer.newPlayer().open(Playlist(audios: audioPlaylist),
//        showNotification: true,
//        notificationSettings: NotificationSettings(
//          prevEnabled: false,
//          playPauseEnabled: false,
//          nextEnabled: false,
//        ));

//    assetsAudioPlayer.shuffle = true;
//    assetsAudioPlayer.loop = true;
//    assetsAudioPlayer.play();
  }

  void stopAudio(){
    player[0] = AssetsAudioPlayer.withId(0.toString());
    player[0].stop();
  }
}
