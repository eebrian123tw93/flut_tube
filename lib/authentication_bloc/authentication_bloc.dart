import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flut_tube/firebase/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository? _userRepository;

  AuthenticationBloc(this._userRepository) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      // TODO: implement event handler
      emit(await mapEventToState(event));
    });
  }
  @override
  AuthenticationState get initialState => Uninitialized();


   mapEventToState(AuthenticationEvent event,) async {

    if (event is AppStarted) {
      return await _mapAppStartedToState();
    } else if (event is LoggedIn) {
      return await _mapLoggedInToState();
    } else if (event is LoggedOut) {
      return await _mapLoggedOutToState();
    }
  }

  Future<AuthenticationState> _mapAppStartedToState() async {
    try {
      final bool isSigned = await _userRepository?.isSignedIn() ?? false;
      if (isSigned) {
        final String? name = await _userRepository?.getUser() ?? "";
        return Authenticated(name ?? "");
      }
      else{
        return Unauthenticated();
      }
    } catch (_) {
      return Unauthenticated();
    }
  }

  Future<AuthenticationState> _mapLoggedInToState() async {
    return Authenticated(await _userRepository?.getUser() ?? "");
  }

  Future<AuthenticationState> _mapLoggedOutToState()async  {
    _userRepository?.signOut();
    return Unauthenticated();
  }
}
