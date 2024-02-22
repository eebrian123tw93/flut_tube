import 'package:flutter/material.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'simple_bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flut_tube/firebase/user_repository.dart';
import 'package:flut_tube/login/login_page.dart';
import 'package:flut_tube/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final UserRepository _userRepository = UserRepository();
  late AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    // TODO: implement initState
    _authenticationBloc = AuthenticationBloc(_userRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => _authenticationBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder(
            bloc: _authenticationBloc,
            builder: (context, state){
              if (state is Authenticated){
                return Container();
              }else if (state is Unauthenticated) {
                return const LoginPage();
              }
              return const SplashPage();
            },
          ),
        )
    );
  }
}

