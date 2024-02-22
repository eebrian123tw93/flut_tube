import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flut_tube/authentication_bloc/authentication_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

// class SplashPageState extends State<SplashPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen.navigate(
//       name: 'assets/intro.riv',
//       next: (context) => const LoginPage(),
//       until: () => Future.delayed(const Duration(seconds: 2)),
//       startAnimation: 'Landing',
//     );
//   }
// }

class SplashPageState extends State<SplashPage> {
  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    // 從Provider取得bloc
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    //　先前是使用SplashScreen.navigate
    //　現在改用callback，因為可以在onSuccess設定動畫結束後要做的事
    return SplashScreen.callback(
      name: 'assets/intro.riv', // flr動畫檔路徑
      onSuccess: (_){_authenticationBloc.add(AppStarted());}, // 動畫結束後觸發AppStarted事件
      until: () => Future.delayed(const Duration(seconds: 3)), //等待3秒
      startAnimation: 'Landing',
      onError: (error, stacktrace) {  }, // 動畫名稱
    );
  }
}