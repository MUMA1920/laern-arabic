// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:LearnArabic1/main.dart';

void main() => runApp(MaterialApp(
  home: fritpagestate(),
));

class fritpagestate extends StatefulWidget {
  const fritpagestate({Key? key}) : super(key: key);

  @override
  fruitpage createState() => fruitpage();
}

class fruitpage extends State<fritpagestate> {
  int index = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache= AudioCache(fixedPlayer: audioPlayer);
  void PlayVoice(int numbermusice) async {
    setState(() async {
      audioPlayer=await audioCache.play("fruot$numbermusice.mp3");



    });
  }

  void nextbutton() {
    setState(() {
      if (index == 19) {
        index = 0;
      } else {
        index++;
      }
      ;
    });

    print("count: $index");
  }

// Action to start over with requesting random texts with a button press, when out of random texts.
  void previousbutton() {
    setState(() {
      if (index == 0) {
        index = 19;
      } else {
        index--;
      }
      ;
    });

    print("count: $index");
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final Widgets = [
      Image.asset('imges/fruot0.png', key: Key('0')),
      Image.asset('imges/fruot1.png', key: Key('1')),
      Image.asset('imges/fruot2.png', key: Key('2')),
      Image.asset('imges/fruot3.png', key: Key('3')),
      Image.asset('imges/fruot4.png', key: Key('4')),
      Image.asset('imges/fruot5.png', key: Key('5')),
      Image.asset('imges/fruot6.png', key: Key('6')),
      Image.asset('imges/fruot7.png', key: Key('7')),
      Image.asset('imges/fruot8.png', key: Key('8')),
      Image.asset('imges/fruot9.png', key: Key('9')),
      Image.asset('imges/fruot10.png', key: Key('10')),
      Image.asset('imges/fruot11.png', key: Key('11')),
      Image.asset('imges/fruot12.png', key: Key('12')),
      Image.asset('imges/fruot13.png', key: Key('13')),
      Image.asset('imges/fruot14.png', key: Key('14')),
      Image.asset('imges/fruot15.png', key: Key('15')),
      Image.asset('imges/fruot16.png', key: Key('16')),
      Image.asset('imges/fruot17.png', key: Key('17')),
      Image.asset('imges/fruot18.png', key: Key('18')),
      Image.asset('imges/fruot19.png', key: Key('19')),

    ];
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('imges/back2.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.passthrough,
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    top: screenHeight * 0.75,
                    right: screenWidth * 0.75,
                    left: screenWidth*0.05,
                    child: GestureDetector(
                      onTap: () {
                        audioPlayer.stop();
                        nextbutton();
                        PlayVoice(index);

                      },
                      child: Image.asset('imges/next_button.png'
                      ),

                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: screenHeight * 0.75,
                    right: screenWidth*0.4,
                    left: screenWidth*0.4,
                    child: GestureDetector(
                      onTap: () {
                        print(index);
                        audioPlayer.stop();
                        PlayVoice(index);
                      },
                      child: Image.asset('imges/play_button.png',
                          width: screenWidth * 0.2, height: screenWidth * 0.2),

                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: screenHeight * 0.75,
                    right: screenWidth*0.05,
                    left: screenWidth * 0.75,
                    child: GestureDetector(
                      onTap: () {
                        audioPlayer.stop();
                        previousbutton();
                        PlayVoice(index);
                      },
                      child: Image.asset('imges/previous_button.png',
                          width: screenWidth * 0.2, height: screenWidth * 0.2),

                    ),
                  ),
                  Positioned(
                      bottom: 150,
                      top: 100,
                      right: 0,
                      left: 0,
                      child: Widgets[index]),
                  Positioned(
                    bottom: screenHeight*0.8,
                    top: screenHeight*0.01,
                    right: screenWidth*0.8,
                    left: screenWidth*0.01,
                    child: InkWell(
                      onTap: () {
                        audioPlayer.stop();
                        checkplay(0);
                        showAd();
                        Navigator.pop(context);
                      },
                      child: Image.asset('imges/undo.png',
                          width: screenWidth * 0.10, height: screenWidth * 0.10),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
