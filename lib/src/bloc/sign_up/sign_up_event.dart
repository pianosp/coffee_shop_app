part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class SignUpNameChanged extends SignUpEvent {
  final String name;

  SignUpNameChanged(this.name);
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged(this.email);
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged(this.password);
}

class SignUpSubmitted extends SignUpEvent {
  final String name;
  final String email;
  final String password;

  SignUpSubmitted(this.name, this.email, this.password);
}

class SignUpClearState extends SignUpEvent {}
