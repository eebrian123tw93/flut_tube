part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationBaseEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}



class AppStarted extends AuthenticationBaseEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationBaseEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationBaseEvent {
  @override
  String toString() => 'LoggedOut';
}
