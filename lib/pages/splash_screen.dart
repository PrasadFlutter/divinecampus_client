// ignore_for_file: unused_field

import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lawexample/NotificationService/local_notification.dart';
import 'package:lawexample/pages/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isForceUpdateVisible = false;
  AppUpdateInfo? _updateInfo;

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

  @override
  void initState() {
    super.initState();
    _notificationInitialize();
    _checkForUpdate();

    Timer(const Duration(milliseconds: 5), () {
      if (mounted) {
        setState(() => _isVisible = true);
      }
    });

    Timer(const Duration(milliseconds: 3200), () {
      if (!mounted) return;
      if (!_isForceUpdateVisible &&
          _updateInfo?.updateAvailability !=
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

  Future<void> _showForceUpdateDialog() async {
    if (!mounted || _isForceUpdateVisible) return;
    _isForceUpdateVisible = true;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text('Update Required'),
            content: const Text(
              'A newer version of Divine Campus is available on the Play Store. Please update to continue.',
            ),
            actions: [
              TextButton(
                onPressed: _triggerUpdate,
                child: const Text('Update Now'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openPlayStoreListing() async {
    const appId = 'com.divine.campus';
    final marketUri = Uri.parse('market://details?id=$appId');
    final webUri = Uri.parse(
      'https://play.google.com/store/apps/details?id=$appId',
    );

    if (await canLaunchUrl(marketUri)) {
      await launchUrl(marketUri, mode: LaunchMode.externalApplication);
      return;
    }

    await launchUrl(webUri, mode: LaunchMode.externalApplication);
  }

  Future<void> _triggerUpdate() async {
    if (Platform.isAndroid) {
      try {
        await InAppUpdate.performImmediateUpdate();
        return;
      } catch (e) {
        debugPrint('Immediate update failed, opening Play Store: $e');
      }
    }

    await _openPlayStoreListing();
  }

  Future<void> _checkForUpdate() async {
    if (!Platform.isAndroid) return;

    try {
      final info = await InAppUpdate.checkForUpdate();
      if (!mounted) return;
      setState(() => _updateInfo = info);

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        await _showForceUpdateDialog();
      }
    } catch (e) {
      debugPrint('Update check failed: $e');
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
                    'assets/images/splash/splashlogo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Limitless Devotion To God',
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
