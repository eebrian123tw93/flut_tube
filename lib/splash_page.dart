import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return SplashScreen.navigate(
      name: 'assets/intro.riv',
      next: (context) => const LoginPage(),
      until: () => Future.delayed(const Duration(seconds: 2)),
      startAnimation: 'Landing',
    );
  }
}