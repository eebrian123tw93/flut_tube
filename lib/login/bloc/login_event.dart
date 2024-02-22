part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent([List props = const []]) : super();
}

class LoginBaseEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}


class EmailChanged extends LoginBaseEvent {
  final String email;

  EmailChanged({required this.email}) : super();

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginBaseEvent {
  final String password;

  PasswordChanged({required this.password}) : super();

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class LoginWithGooglePressed extends LoginBaseEvent {
  @override
  String toString() => 'LoginWithGooglePressed';
}

class LoginWithCredentialsPressed extends LoginBaseEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({required this.email, required this.password})
      : super();

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}