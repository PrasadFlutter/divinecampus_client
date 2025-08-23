// ignore_for_file: unused_field

import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lawexample/NotificationService/local_notification.dart';
import 'package:lawexample/pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:in_app_update/in_app_update.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

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

  AppUpdateInfo? _updateInfo;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _notificationInitialize();
    _checkForUpdate();

    // Show fade after 5ms
    Timer(const Duration(milliseconds: 5), () {
      setState(() => _isVisible = true);
    });

    // Navigate to home after 3.2 sec (if no update is blocking)
    Timer(const Duration(milliseconds: 3200), () {
      if (_updateInfo?.updateAvailability !=
          UpdateAvailability.updateAvailable) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => ProfilePage()),
          (route) => false,
        );
      }
    });
  }

  Future<void> _notificationInitialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    LocalNotification.initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
    });
  }

  /// 🔹 Check for Play Store app update
  Future<void> _checkForUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      setState(() => _updateInfo = info);

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        // Immediate update = user must update before using app
        await InAppUpdate.performImmediateUpdate();

        // 👉 Or, if you prefer flexible update (downloads in background):
        // await InAppUpdate.startFlexibleUpdate();
        // await InAppUpdate.completeFlexibleUpdate();
      }
    } catch (e) {
      debugPrint("Update check failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe00040), Color(0xffe00040)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/splash/splashlogo.png",
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Limitless Devotion To God",
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 10),//check push
            ],
          ),
        ),
      ),
    );
  }
}
