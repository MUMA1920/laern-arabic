// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:auto_size_text/auto_size_text.dart';

class mathpage extends StatefulWidget {
  var signalv;
  mathpage({Key? key, this.signalv}) : super(key: key);

  @override
  State<mathpage> createState() => _mathpage();
}

class _mathpage extends State<mathpage> {
  late var number1 = 1;
  late var number2 = 1;
  late var button1 = 0;
  late var button2 = 0;
  late var button3 = 0;
  late int button = 0;
  late int cunttrueans = 0;
  late int cont = 1;
  AudioPlayer audioPlayer = AudioPlayer();
  late AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final Widgets = [
      const Center(
          child: Text(
        '٠',
        key: Key('0'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text(
        '١',
        key: Key('1'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text('٢', key: Key('2'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text(
        '٣',
        key: Key('3'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text('٤', key: Key('4'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text(
        '٥',
        key: Key('5'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text('٦	', key: Key('6'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text(
        '٧',
        key: Key('7'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text('٨', key: Key('8'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text(
        '٩',
        key: Key('9'),
        style: TextStyle(fontSize: 50),
      )),
      const Center(
          child: Text('١٠', key: Key('10'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١١', key: Key('11'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٢', key: Key('12'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٣', key: Key('13'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٤', key: Key('14'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٥', key: Key('15'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٦', key: Key('16'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٧', key: Key('17'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٨', key: Key('18'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('١٩', key: Key('19'), style: TextStyle(fontSize: 50))),
      const Center(
          child: Text('٢٠', key: Key('20'), style: TextStyle(fontSize: 50))),
    ];
    final Signalwidget = [
      const Text(
        '+',
        key: Key('1'),
        style: TextStyle(fontSize: 50),
      ),
      const Text('-', key: Key('2'), style: TextStyle(fontSize: 50))
    ];
    number1fun();
    number2fun();
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
                  bottom: screenHeight * 0.63,
                  top: screenHeight * 0.14,
                  right: screenWidth * 0.10,
                  left: screenWidth * 0.65,
                  child: Material(
                      color: Colors.blue,
                      elevation: 15,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Widgets[number1])),
              Positioned(
                  bottom: screenHeight * 0.63,
                  top: screenHeight * 0.14,
                  right: screenWidth * 0.65,
                  left: screenWidth * 0.10,
                  child: Material(
                      color: Colors.blue,
                      elevation: 15,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Widgets[number2])),
              Positioned(
                  bottom: screenHeight * 0.65,
                  top: screenHeight * 0.15,
                  right: screenWidth * 0.4,
                  left: screenWidth * 0.4,
                  child: Material(
                      color: Colors.pinkAccent[200],
                      elevation: 9,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(child: Signalwidget[widget.signalv]))),
              Positioned(
                  bottom: screenHeight * 0.20,
                  top: screenHeight * 0.40,
                  right: screenWidth * 0.05,
                  left: screenWidth * 0.05,
                  child: Material(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: const Align(
                        alignment: Alignment.topCenter,
                        child: AutoSizeText(
                          'اختر الاجابة الصحيحة',
                          style: TextStyle(
                              fontFamily: 'Lemonada',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                      ))),
              Positioned(
                  bottom: screenHeight * 0.30,
                  top: screenHeight * 0.50,
                  right: screenWidth * 0.4,
                  left: screenWidth * 0.4,
                  // ignore: deprecated_member_use
                  child: Material(
                    color: Colors.yellow[300],
                    borderRadius: BorderRadius.circular(20),
                    elevation: 15,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        onTap: () {
                          print('klik1 $button1');
                          checkans(button1);
                        },
                        child: Center(child: Widgets[chose(1)])),
                  )),
              Positioned(
                  bottom: screenHeight * 0.30,
                  top: screenHeight * 0.50,
                  right: screenWidth * 0.70,
                  left: screenWidth * 0.10,
                  // ignore: deprecated_member_use
                  child: Material(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(20),
                    elevation: 15,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        onTap: () {
                          print('klik2 $button2');
                          checkans(button2);
                        },
                        child: Center(child: Widgets[chose(2)])),
                  )),
              Positioned(
                  bottom: screenHeight * 0.30,
                  top: screenHeight * 0.50,
                  right: screenWidth * 0.10,
                  left: screenWidth * 0.70,
                  // ignore: deprecated_member_use
                  child: Material(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(20),
                    elevation: 15,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                        onTap: () {
                          print('klik3  $button3');
                          checkans(button3);
                        },
                        child: Center(child: Widgets[chose(3)])),
                  )),
              Positioned(
                  bottom: screenHeight * 0.82,
                  top: screenHeight * 0.01,
                  right: screenWidth * 0.02,
                  left: screenWidth * 0.82,
                  // ignore: deprecated_member_use
                  child: Material(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 15,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Center(child: Widgets[cont])),),

              Positioned(
                bottom: screenHeight * 0.8,
                top: screenHeight * 0.01,
                right: screenWidth * 0.8,
                left: screenWidth * 0.01,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('imges/undo.png'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  number2fun() {
    setState(() {});
    if (widget.signalv == 0) {
      number2 = Random().nextInt(10);
      if (number2 == 0) number2 = 1;
    } else {
      number2 = Random().nextInt(10);

      if (number2 > number1) {
        print('this number1imtial $number1');
        print('this number2intial $number2');
        var swap = number1;
        number1 = number2;
        number2 = swap;
      }
    }
  }

  number1fun() {
    setState(() {});
    if (widget.signalv == 0) {
      number1 = Random().nextInt(10);
      if (number1 == 0) number1 = 1;
    } else {
      number1 = Random().nextInt(10);
    }
  }

  void refresh() {
    setState(() {
      button1 = 0;
      button2 = 0;
      button3 = 0;
      button = 0;
    });
  }

  trueAns() {
    if (widget.signalv == 0) {
      return number1 + number2;
    } else if (widget.signalv == 1 && number1 < number2) {
      return number1 - number2;
    } else if (widget.signalv == 1 && number1 > number2) {
      return number1 - number2;
    } else if (widget.signalv == 1 && number1 == number2) {
      return 0;
    }
  }

  checkans(int ans) {

    if (ans == trueAns()) {cunttrueans++;}
      if(cont ==10) {
        if (cunttrueans >= 5) {
          Alert(
            context: context,
            image: Image.asset('imges/correct.png'),
            desc: " درجتك =${replaceFarsiNumber(10)} / ${replaceFarsiNumber(cunttrueans)}",
            buttons: [
              DialogButton(
                  child: const Text(
                    "اللعب مجدداً",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    cont=1;
                  cunttrueans=0;
                    Navigator.of(context, rootNavigator: true).pop();
                    refresh();
                  })
            ],
          ).show();
          audioCache.play("correct.mp3") as AudioPlayer;
        }

     else  {
      Alert(
        context: context,
        image: Image.asset('imges/try again.png'),
        desc: "درجتك = ${replaceFarsiNumber(10)} / ${replaceFarsiNumber(cunttrueans)}",
        buttons: [
          DialogButton(
              child: const Text(
                "أعد المحاولة",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                cont=1;
                cunttrueans=0;
                Navigator.of(context, rootNavigator: true).pop();
                refresh();
              })
        ],
      ).show();
      audioCache.play("try again.mp3") as AudioPlayer;
    }

      }
    else{
      refresh();
      if(cont>10){cont==1;}
      }


    cont++;  print('cont $cont');
  }

  chose(int cho) {
    List<int> lst = [Random().nextInt(20), trueAns(), Random().nextInt(20)];

    if (button1 == 0 && cho == 1) {
      button1 = lst[Random().nextInt(3)];
      button = button1;
      print(' button1 $button');
    } else if (button2 == 0 && cho == 2) {
      button2 = lst[Random().nextInt(3)];
      if (button2 == button1) {
        button2 = Random().nextInt(20);
      }
      button = button2;
      print(' button2 $button');
    } else if (button3 == 0 && cho == 3) {
      if (button1 == trueAns() || button2 == trueAns()) {
        button3 = lst[Random().nextInt(3)];
        if (button3 == button1 || button2 == button3) {
          button3 = Random().nextInt(20);
        }
        button = button3;
        print(' button3 $button');
      } else {
        print(' button31 ${trueAns()}');
        button = button3 = trueAns();

        print(' button31 $button');
      }
    }

    print(' ---------------');
    return button;
  }
   replaceFarsiNumber(int input) {
    const arab = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹','١٠'];

    if (input == 0) {
      return arab[0];
    }
    if (input == 1) {
      return arab[1];
    }
    if (input == 2) {
      return arab[2];
    }
    if (input == 3) {
      return arab[3];
    }
    if (input == 4) {
      return arab[4];
    }
    if (input == 5) {
      return arab[5];
    }
    if (input == 6) {
      return arab[6];
    }
    if (input == 7) {
      return arab[7];
    }
    if (input == 8) {
      return arab[8];
    }
    if (input == 9) {
      return arab[9];
    }
    if (input == 10) {
      return arab[10];
    }

  }
}
