import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:ambience/model/audiomodel.dart';

class ReusableCard extends StatefulWidget {
  final Widget cardChild;
  final Function onPress;
  final String audioAlbum;
  final int listNumber;

  ReusableCard({
    this.audioAlbum,
    this.cardChild,
    this.onPress,
    this.listNumber,
  });
  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  Color color = Color(0xff303960);
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){

      },
      onTap: () {
        setState(() {
          if(playing){
            playing =false;
            color = Color(0xff303960);
          }
          else{
            playing= true;
            color = Colors.blueAccent.shade700;
            widget.onPress(widget.listNumber,widget.audioAlbum);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.cardChild,
        ),
//        child: Center(
//          child: Text(
//            centerText,
//            style: kCardTitle,
//            textAlign: TextAlign.center,
//          ),
//        ),
//      color: playing?Colors.grey.shade700: Colors.grey.shade900,
        decoration: BoxDecoration(
          color: color,
          //Color(0x80363062)
//          image: DecorationImage(
//              image: AssetImage(image),
//              fit: BoxFit.fill,
//              colorFilter: ColorFilter.mode(
//                Color(0x80363062),
//                BlendMode.hue,
//              )),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
