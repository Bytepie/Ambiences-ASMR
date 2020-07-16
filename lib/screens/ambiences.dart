import 'package:flutter/material.dart';
import 'package:ambience/constants.dart';
import 'package:ambience/reusable_card.dart';

//import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:ambience/model/audiomodel.dart';
import 'package:ambience/model/audiolist.dart';

class Ambiences extends StatefulWidget {
  Ambiences({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AmbiencesState createState() => _AmbiencesState();
}

class _AmbiencesState extends State<Ambiences> {
//  AudioCache player = AudioCache();
//  AudioPlayer audioPlayer = AudioPlayer();

  AudioModel audioModel = AudioModel();

//  List<ReusableCard> mySoundCards= [];

  void playAudio(int myListNumber, String category) {
    audioModel.playAsmrRandom(myListNumber, category);
//    audioPlayer.stop();
//    if (audioFile != null) {
////  AudioCache player = AudioCache(prefix: 'assets/');
//      audioPlayer = await player.loop(audioFile);
//    }
  }

  List<ReusableCard> buildPlayBoxes(String category) {
    int numberOfSounds = audiolist[category].length;
    List<ReusableCard> mySoundCards = [];
    int myLoop = 0;
    for (var sound in audiolist[category]) {
      mySoundCards.add(ReusableCard(
        onPress: playAudio,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(sound['image']),
              width: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              sound['name'],
              textAlign: TextAlign.center,
              style: kCardTitle,
            ),
          ],
        ),
        audioAlbum: category,
        listNumber: myLoop,
      ));

      myLoop++;
    }
    return mySoundCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
////        flexibleSpace: FlexibleSpaceBar(background: Image.asset('branding.png'),),
////      flexibleSpace:
//        elevation: 0,
//        backgroundColor: Color(0xFF21243d), //Color(0xff12104a)
//        centerTitle: true,
//        title: Text(
//          'Mystic Ambiences',
//          style: kAppTitle,
//        ),
//      ),
      body: ambienceScrollView(context),
    );
  }

  Widget ambienceScrollView(BuildContext context) {
    return Container(
      color: Color(0xff110133),
//      decoration: BoxDecoration(
//          gradient: LinearGradient(colors: [
//        Color(0xFF413c69),
//        Color(0xFF000000),
////        Color(0xFF4a47a3),
//      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverAppBar(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(40))),
              //topLeft: Radius.circular(40)
              title: Text('Mystic Ambiences'),
              centerTitle: true,
              backgroundColor: Colors.indigo.shade700,
//              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/source.gif',
                    fit: BoxFit.fitWidth),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 3,
                children: buildPlayBoxes('asmr_sounds'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
