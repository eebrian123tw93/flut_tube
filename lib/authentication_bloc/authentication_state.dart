part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationInitial {
  @override
  String toString() {
    return 'Uninitialized';
  }
}

class Authenticated extends AuthenticationInitial {
  final String userName;
  Authenticated(this.userName) : super();


  @override
  List<Object> get props => [userName];

  @override
  String toString() {
    return 'Authenticated {UserName: $userName}';
  }
}

class Unauthenticated extends AuthenticationInitial {
  @override
  String toString() {
    return 'Unauthenticated';
  }
}