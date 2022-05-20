// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:LearnArabic1/main.dart';
import 'package:LearnArabic1/classofbottun/maht.dart';

void main() => runApp(MaterialApp(
      home: mainnumberstate(),
    ));

class mainnumberstate extends StatefulWidget {
  const mainnumberstate({Key? key}) : super(key: key);

  @override
  numberstate createState() => numberstate();
}

class numberstate extends State<mainnumberstate> {
  late int inex;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                    bottom: screenHeight * 0.55,
                    top: screenHeight * 0.13,
                    right: screenWidth * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                        color: Colors.blueAccent,
                        //لون البوتن
                        elevation: 9,
                        //الضل
                        borderRadius: BorderRadius.circular(20),
                        //تدوير حواف البوتن
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            inex = 0;
                            var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  numberpagestate(),
                            );
                            Navigator.of(context).push(route);
                          },
                          child: const Center(
                            child: Text(
                              'ارقام',
                              style: TextStyle(
                                  fontFamily: 'Lemonada',
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        //الكتابه تحت البوتن

                        )),
                Positioned(
                    bottom: screenHeight * 0.3,
                    top: screenHeight * 0.4,
                    right: screenWidth * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                        color: Colors.redAccent[200],
                        //لون البوتن
                        elevation: 9,
                        //الضل
                        borderRadius: BorderRadius.circular(20),
                        //تدوير حواف البوتن
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  mathpage(signalv: 0),
                            );
                            Navigator.of(context).push(route);
                          },
                          child: const Center(
                            child: Text(
                              'جمع',
                              style: TextStyle(
                                  fontFamily: 'Lemonada',
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        //الكتابه تحت البوتن

                        )),
                Positioned(
                    bottom: screenHeight * 0.05,
                    top: screenHeight * 0.65,
                    right: screenWidth * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                        color: Colors.orangeAccent[400],
                        //لون البوتن
                        elevation: 9,
                        //الضل
                        borderRadius: BorderRadius.circular(20),
                        //تدوير حواف البوتن
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  mathpage(signalv: 1),
                            );
                            Navigator.of(context).push(route);
                          },
                          child: const Center(
                            child: Text(
                              'طرح',
                              style: TextStyle(
                                  fontFamily: 'Lemonada',
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        //الكتابه تحت البوتن

                        )),
                Positioned(
                  bottom: screenHeight * 0.8,
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.8,
                  left: screenWidth * 0.01,
                  child: InkWell(
                    onTap: () {                    checkplay(0);
                    showAd();
                    Navigator.pop(context);
                    },
                    child: Image.asset('imges/undo.png',
                        width: screenWidth * 0.10, height: screenWidth * 0.10),
                  ),
                ),
              ]),
        ),
      )),
    );
  }
}

class numberpagestate extends StatefulWidget {
  const numberpagestate({Key? key}) : super(key: key);

  @override
  numberpage createState() => numberpage();
}

class numberpage extends State<numberpagestate> {
  int index = 0;

  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);

  void PlayVoice(int numbermusice) async {
    setState(() async {
      audioPlayer = await audioCache.play("number ($numbermusice).mp3");
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
      Image.asset('imges/number1.png', key: Key('1')),
      Image.asset('imges/number2.png', key: Key('2')),
      Image.asset('imges/number3.png', key: Key('3')),
      Image.asset('imges/number4.png', key: Key('4')),
      Image.asset('imges/number5.png', key: Key('5')),
      Image.asset('imges/number6.png', key: Key('6')),
      Image.asset('imges/number7.png', key: Key('7')),
      Image.asset('imges/number8.png', key: Key('8')),
      Image.asset('imges/number9.png', key: Key('9')),
      Image.asset('imges/number10.png', key: Key('10')),
      Image.asset('imges/number11.png', key: Key('11')),
      Image.asset('imges/number12.png', key: Key('12')),
      Image.asset('imges/number13.png', key: Key('13')),
      Image.asset('imges/number14.png', key: Key('14')),
      Image.asset('imges/number15.png', key: Key('15')),
      Image.asset('imges/number16.png', key: Key('16')),
      Image.asset('imges/number17.png', key: Key('17')),
      Image.asset('imges/number18.png', key: Key('18')),
      Image.asset('imges/number19.png', key: Key('19')),
      Image.asset('imges/number20.png', key: Key('20')),
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
                left: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    audioPlayer.stop();
                    nextbutton();
                    PlayVoice(index + 1);
                  },
                  child: Image.asset('imges/next_button.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                top: screenHeight * 0.75,
                right: screenWidth * 0.4,
                left: screenWidth * 0.4,
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
                right: screenWidth * 0.05,
                left: screenWidth * 0.75,
                child: GestureDetector(
                  onTap: () {
                    audioPlayer.stop();
                    previousbutton();
                    PlayVoice(index + 1);
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
                bottom: screenHeight * 0.8,
                top: screenHeight * 0.01,
                right: screenWidth * 0.8,
                left: screenWidth * 0.01,
                child: InkWell(
                  onTap: () {
                    audioPlayer.stop();
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
