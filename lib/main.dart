import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  List <Color> colorList = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.yellow, Colors.brown,Colors.purple];
  List <Widget> list = [];

  void playSound(int number){
    final player = AudioCache();
    player.play('note$number.wav');
  }

  Expanded buildKey(int number, Color color){
    return Expanded(
      child: TextButton(
        style: (TextButton.styleFrom(
          backgroundColor: color
        )),
        onPressed: (){
          playSound(number);
        },
      ),
    );
  }

  void keyGenerator(){
    for(int i =1; i<8;i++){
      list.add(buildKey(i, colorList[i-1]));
    }
  }

  @override
  Widget build(BuildContext context) {
    keyGenerator();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: list,
          ),
        ),
      ),
    );
  }
}
