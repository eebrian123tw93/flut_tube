import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flut_tube/firebase/user_repository.dart';

import 'package:flut_tube/login/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginState.empty()) {
    on<EmailChanged>((event, emit) {
      state.update(isEmailValid: Validators.isValidEmail(event.email));
    }, transformer: (events, mapper) {
      return events.debounceTime(const Duration(milliseconds: 300)).asyncExpand(mapper);
    });

    on<PasswordChanged>((event, emit) {
      state.update(isPasswordValid: Validators.isValidPassword(event.password));
    }, transformer: (events, mapper) {
      return events.debounceTime(const Duration(milliseconds: 300)).asyncExpand(mapper);
    });

    on<LoginWithGooglePressed>((event, emit) async {
      try {
        await _userRepository.signInWithGoogle();
        emit(LoginState.success());
      } catch (_) {
        emit(LoginState.failure());
      }
    });

    on<LoginWithCredentialsPressed>((event, emit) async {
      emit(LoginState.loading());
      try {
        await _userRepository.signInWithCredentials(event.email, event.password);
        emit(LoginState.success());
      } catch (_) {
        emit(LoginState.failure());
      }
    });

  }
}
