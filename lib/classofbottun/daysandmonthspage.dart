import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:LearnArabic1/main.dart';


void main() => runApp(const MaterialApp(
      home: daysandmonthspagestate(),
    ));

class daysandmonthspagestate extends StatefulWidget {
  const daysandmonthspagestate({Key? key}) : super(key: key);

  @override
  daysandmonthspage createState() => daysandmonthspage();
}

class daysandmonthspage extends State<daysandmonthspagestate> {

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
                    bottom: screenHeight * 0.45,
                    top: screenHeight * 0.15,
                    right: screenWidth * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                        color: Colors.blueAccent,
                        //لون البوتن
                        elevation: 9,
                        //الضل
                        borderRadius: BorderRadius.circular(40),
                        //تدوير حواف البوتن
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {

                            var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  daypagestate(index:0),
                            );
                            Navigator.of(context).push(route);
                          },
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('imges/day.png'),)
                        )
                        //الكتابه تحت البوتن

                        )),
                Positioned(
                    bottom: screenHeight * 0.1,
                    top: screenHeight * 0.5,
                    right: screenWidth * 0.02,
                    left: screenWidth * 0.02,
                    child: Material(
                        color: Colors.redAccent[200],
                        //لون البوتن
                        elevation: 9,
                        //الضل
                        borderRadius: BorderRadius.circular(40),
                        //تدوير حواف البوتن
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {

                            var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  daypagestate(index:7,),
                            );
                            Navigator.of(context).push(route);
                          },
                          child:FittedBox(
                            fit: BoxFit.fill,
                            child:  Image.asset('imges/month.png'),)
                        )
                        //الكتابه تحت البوتن

                        )),
                Positioned(
                  bottom: screenHeight * 0.8,
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.8,
                  left: screenWidth * 0.01,
                  child: InkWell(
                    onTap: () {checkplay(0);
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

class daypagestate extends StatefulWidget {
  var index;
  daypagestate({this.index,}) ;

  @override
  daypage createState() => daypage();
}

class daypage extends State<daypagestate> {
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
  void PlayVoice(int numbermusice) async {
    setState(() async {
      audioPlayer = await audioCache.play("day ($numbermusice).mp3");
    });
  }

  void nextbutton() {
    if(widget.index<=6){
    setState(() {
      if (widget.index == 6) {
        widget.index = 0;
      } else {
        widget.index++;
      };}

    );
    }
    else
      setState(() {
        if (widget.index == 18) {
          widget.index = 7;
        } else {
          widget.index++;
        };}

      );
  }



// Action to start over with requesting random texts with a button press, when out of random texts.
  void previousbutton() {
    if(widget.index<=6){
      setState(() {
        if (widget.index == 0) {
          widget.index = 6;
        } else {
          widget.index--;
        };}

      );
    }
    else {
      setState(() {
        if (widget.index == 7) {
          widget.index = 18;
        } else {
          widget.index--;
        };}

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final Widgets = [
      Image.asset('imges/day (1).png', key: Key('1')),
      Image.asset('imges/day (2).png', key: Key('2')),
      Image.asset('imges/day (3).png', key: Key('3')),
      Image.asset('imges/day (4).png', key: Key('4')),
      Image.asset('imges/day (5).png', key: Key('5')),
      Image.asset('imges/day (6).png', key: Key('6')),
      Image.asset('imges/day (7).png', key: Key('7')),
      Image.asset('imges/day (8).png', key: Key('8')),
      Image.asset('imges/day (9).png', key: Key('9')),
      Image.asset('imges/day (10).png', key: Key('10')),
      Image.asset('imges/day (11).png', key: Key('11')),
      Image.asset('imges/day (12).png', key: Key('12')),
      Image.asset('imges/day (13).png', key: Key('13')),
      Image.asset('imges/day (14).png', key: Key('14')),
      Image.asset('imges/day (15).png', key: Key('15')),
      Image.asset('imges/day (16).png', key: Key('16')),
      Image.asset('imges/day (17).png', key: Key('17')),
      Image.asset('imges/day (18).png', key: Key('18')),
      Image.asset('imges/day (19).png', key: Key('19')),

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
                    PlayVoice(widget.index + 1);
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
                    print(widget.index);
                    audioPlayer.stop();
                    PlayVoice(widget.index + 1);
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
                    PlayVoice(widget.index + 1);
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
                  child: Widgets[widget.index]),
              Positioned(
                bottom: screenHeight * 0.8,
                top: screenHeight * 0.01,
                right: screenWidth * 0.8,
                left: screenWidth * 0.01,
                child: InkWell(
                  onTap: () {
                    audioPlayer.stop();
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
