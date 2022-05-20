// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:LearnArabic1/main.dart';

void main() => runApp(MaterialApp(
  home: animalpagestate(),
));

class animalpagestate extends StatefulWidget {
  const animalpagestate({Key? key}) : super(key: key);

  @override
  animalpage createState() => animalpage();
}

class animalpage extends State<animalpagestate> {
  int index = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache= AudioCache(fixedPlayer: audioPlayer);
  void PlayVoice(int numbermusice) async {
    setState(() async {
      audioPlayer=await audioCache.play("animal$numbermusice.mp3");



    });
  }

  void nextbutton() {
    setState(() {
      if (index == 10) {
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
        index = 10;
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
      Image.asset('imges/animal1.png', key: Key('1')),
      Image.asset('imges/animal2.png', key: Key('2')),
      Image.asset('imges/animal3.png', key: Key('3')),
      Image.asset('imges/animal4.png', key: Key('4')),
      Image.asset('imges/animal5.png', key: Key('5')),
      Image.asset('imges/animal6.png', key: Key('6')),
      Image.asset('imges/animal7.png', key: Key('7')),
      Image.asset('imges/animal8.png', key: Key('8')),
      Image.asset('imges/animal9.png', key: Key('9')),
      Image.asset('imges/animal10.png', key: Key('10')),
      Image.asset('imges/animal11.png', key: Key('11')),

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
                        PlayVoice(index+1);

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
                        PlayVoice(index + 1);
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
                        PlayVoice(index+1);
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
                        checkplay(0);showAd();
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
