import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/cursor_tracking.riv',
      next: (context) => LoginPage(),
      until: () => Future.delayed(Duration(seconds: 2)),
      startAnimation: 'Landing',
    );
  }
}