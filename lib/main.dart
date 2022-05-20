import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'classofbottun/alphapage.dart';
import 'classofbottun/colorspage.dart';
import 'classofbottun/daysandmonthspage.dart';
import 'classofbottun/numberspage.dart';
import 'classofbottun/fruitpage.dart';
import 'classofbottun/animalspage.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
late int index = 0;

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-4119224742286087/3189161110',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('ad is loaded');
        openAd = ad;
        // openAd!.show();
      }, onAdFailedToLoad: (error) {
        print('ad failed to load $error');
      }),
      orientation: AppOpenAd.orientationPortrait);
}

void showAd() {
  if (openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }

  openAd!.fullScreenContentCallback =
      FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
        print('onAdShowedFullScreenContent');
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        print('failed to load $error');
        openAd = null;
        loadAd();
      }, onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        print('dismissed');
        openAd = null;
        loadAd();
      });

  openAd!.show();
}
AudioPlayer audioPlayer = AudioPlayer();
late AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);
checkplay(int indexmu) async {

  if (indexmu == 0) {
index=0;
    audioPlayer = await audioCache.play('home_music.mp3');
  }
  else {
    audioPlayer.pause();

  }
}
void main() {
  showAd();
  runApp(MaterialApp(home: SplashScreen()));
}

const int maxFailedLoadAttempts = 3;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePageState())));

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('imges/splash screeen.png'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}

class HomePageState extends StatefulWidget {
  const HomePageState({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<HomePageState> with WidgetsBindingObserver {


@override
void initState() {
  super.initState();
 showAd();
  WidgetsBinding.instance?.addObserver(this);
}@override
void didChangeAppLifecycleState(AppLifecycleState state){
  super.didChangeAppLifecycleState(state);
  if(state == AppLifecycleState.inactive ||
      state == AppLifecycleState.detached)return;
  final isBackground= state ==AppLifecycleState.paused;
  if (isBackground){
    audioPlayer.pause();
  }
  else {
      audioPlayer.resume();
    }
  }
 @override
 void dispose() {
   checkplay(0);
   WidgetsBinding.instance?.removeObserver(this);
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    checkplay(index);
    final Widgets = [
      Image.asset(
        'imges/music_on.png',
        width: screenWidth * 0.10,
        height: screenWidth * 0.10,
        key: Key('1'),
      ),
      Image.asset(
        'imges/music_off.png',
        width: screenWidth * 0.10,
        height: screenWidth * 0.10,
        key: Key('2'),
      ),
    ];
    return
     MaterialApp(
        home: Scaffold(
          body: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: Text(
                  'اضغط مرة اخرى للخروج من التطبيق',
                  style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),

            child:

            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraint) {
                  double loclheight = constraint.maxHeight;
                  double loclwidth = constraint.maxWidth;
                  return Container(
                    width: screenWidth,
                    height: screenHeight,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('imges/back.jpg'),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                      //العمود اليجمع البوتنات مع ال appbar
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                width: screenWidth * 0.5,

                                //يحتوي زر exit

                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                      onTap: () {
                                        SystemNavigator.pop();
                                        audioPlayer.pause();
                                      },
                                      child: Image.asset('imges/cancel_button.png',
                                          width: screenWidth * 0.10,
                                          height: screenWidth * 0.10)),
                                )),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                              width: screenWidth * 0.5,

                              //يحتوي على زر ايقاف الصوت

                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {    showAd();

                                    final isLast = index == Widgets.length - 1;
                                      setState(
                                          () => index = isLast ? 0 : index + 1);
                                      checkplay(index);
                                    },
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      child: Widgets[index],
                                    )),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //يتحكم ب المسافه بين ال appbar و الازرار
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            runAlignment: WrapAlignment.spaceAround,
                            spacing: loclwidth * 0.1,
                            runSpacing: loclheight * 0.02,
                            children: [
                              Material(
                                  color: Colors.blueGrey,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {

                                    audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  alphapagestate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/alpha.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),

                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'احرف',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ) //الكتابه تحت البوتن
                                        ]),
                                  )),
                              Material(
                                  color: Colors.teal,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  colorpagestate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/color.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'ألوان و اشكال',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ) //الكتابه تحت البوتن
                                        ]),
                                  )),
                              Material(
                                  color: Colors.indigo,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  mainnumberstate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/number.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'رياضيات',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ) //الكتابه تحت البوتن
                                        ]),
                                  )),
                              Material(
                                  color: Colors.deepPurpleAccent,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  animalpagestate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/animl.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'حيونات',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ) //الكتابه تحت البوتن
                                        ]),
                                  )),
                              Material(
                                  color: Colors.redAccent,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  fritpagestate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/fruit.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'فواكه و خضروات',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                          //الكتابه تحت البوتن
                                        ]),
                                  )),
                              Material(
                                  color: Colors.lightGreen,
                                  //لون البوتن
                                  elevation: 9,
                                  //الضل
                                  borderRadius: BorderRadius.circular(20),
                                  //تدوير حواف البوتن
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {
                                      audioPlayer.pause();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  daysandmonthspagestate()));
                                    },
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 15, 15, 0),
                                            child: Ink.image(
                                              image: const AssetImage(
                                                  'imges/time.gif'),
                                              //صوره البوتن وابعدها
                                              height: loclwidth / 3,
                                              width: loclwidth / 3,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                              'ايام و اشهر',
                                              style: TextStyle(
                                                  fontFamily: 'Lemonada',
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )

                                          //الكتابه تحت البوتن
                                        ]),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),

    );
  }
}
