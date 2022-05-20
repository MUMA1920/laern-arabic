// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:LearnArabic1/main.dart';

void main() => runApp(MaterialApp(
      home: alphapagestate(),
    ));

class alphapagestate extends StatefulWidget {
  const alphapagestate({Key? key}) : super(key: key);

  @override
  alphapage createState() => alphapage();
}

class alphapage extends State<alphapagestate> {
  int index = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache= AudioCache(fixedPlayer: audioPlayer);
  void PlayVoice(int numbermusice) async {
setState(() async {
  audioPlayer=await audioCache.play("an$numbermusice.mp3");

});
  }

  void nextbutton() {
    setState(() {
      if (index == 27) {
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
        index = 27;
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
      Image.asset('imges/alpha1.png', key: Key('1')),
      Image.asset('imges/alpha2.png', key: Key('2')),
      Image.asset('imges/alpha3.png', key: Key('3')),
      Image.asset('imges/alpha4.png', key: Key('4')),
      Image.asset('imges/alpha5.png', key: Key('5')),
      Image.asset('imges/alpha6.png', key: Key('6')),
      Image.asset('imges/alpha7.png', key: Key('7')),
      Image.asset('imges/alpha8.png', key: Key('8')),
      Image.asset('imges/alpha9.png', key: Key('9')),
      Image.asset('imges/alpha10.png', key: Key('10')),
      Image.asset('imges/alpha11.png', key: Key('11')),
      Image.asset('imges/alpha12.png', key: Key('12')),
      Image.asset('imges/alpha13.png', key: Key('13')),
      Image.asset('imges/alpha14.png', key: Key('14')),
      Image.asset('imges/alpha15.png', key: Key('15')),
      Image.asset('imges/alpha16.png', key: Key('16')),
      Image.asset('imges/alpha17.png', key: Key('17')),
      Image.asset('imges/alpha18.png', key: Key('18')),
      Image.asset('imges/alpha19.png', key: Key('19')),
      Image.asset('imges/alpha20.png', key: Key('20')),
      Image.asset('imges/alpha21.png', key: Key('21')),
      Image.asset('imges/alpha22.png', key: Key('22')),
      Image.asset('imges/alpha23.png', key: Key('23')),
      Image.asset('imges/alpha24.png', key: Key('24')),
      Image.asset('imges/alpha25.png', key: Key('25')),
      Image.asset('imges/alpha26.png', key: Key('26')),
      Image.asset('imges/alpha27.png', key: Key('27')),
      Image.asset('imges/alpha28.png', key: Key('28')),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SafeArea(
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
      ),
    );
  }
}
