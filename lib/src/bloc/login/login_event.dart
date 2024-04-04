part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  LoginEmailChanged(this.email);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;
  LoginSubmitted(this.email, this.password);
}

class LoginClearState extends LoginEvent {}
