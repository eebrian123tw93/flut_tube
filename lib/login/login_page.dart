import 'package:flut_tube/login/login_form.dart';
import 'package:flut_tube/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flut_tube/firebase/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {

  final UserRepository _userRepository;

  const LoginPage(this._userRepository, {super.key}) ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(_userRepository),
      child: LoginForm(_userRepository),
    );
  }
}