part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, success, failure }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String name;
  final String email;
  final String password;
  final String message;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.name = '',
    this.email = '',
    this.password = '',
    this.message = '',
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? name,
    String? email,
    String? password,
    String? message,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, name, email, password, message];
}
