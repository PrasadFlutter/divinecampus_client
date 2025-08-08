// ignore_for_file: unused_field

import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/NotificationService/local_notification.dart';
import 'package:lawexample/pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _SplashScreenState() {
    Timer(const Duration(milliseconds: 3200), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ProfilePage()),
          (route) => false,
        );
      });
    });

    Timer(const Duration(milliseconds: 5), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  void initState() {
    NotificationInitalize();
    super.initState();
  }

  NotificationInitalize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    LocalNotification.initialize();
    await FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[600],
      body:
          //backgroundColor: Colors.white,
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffe00040), Color(0xffe00040)],
                begin: const FractionalOffset(0, 0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 50,),
                  /*CircleAvatar(
                      radius: 100,
                  backgroundImage: AssetImage("assets/images/splash/dilogo.PNG"),
                    backgroundColor: Colors.transparent,
                  ),*/
                  ScaleTransition(
                    scale: _animation,
                    // position: null,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/splash/splashlogo.png",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),

                  Text(
                    "Limitless Devotion To God",
                    style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      // fontFamily: 'Canterbury',
                    ),
                  ),
                  /*          SizedBox(
                //    width: 250.0,
                    child: DefaultTextStyle(
                      style: GoogleFonts.courgette(
                          fontSize: 20.0,
                          color: Colors.white,
                        fontStyle: FontStyle.italic
                        // fontFamily: 'Canterbury',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                         // TyperAnimatedText('Divine Campus'),
                          TyperAnimatedText ('Limitless Devotion To God'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
    );
  }
}
