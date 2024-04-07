part of 'user_bloc.dart';

enum UserResponseStatus { initial, success, failure }

class UserState extends Equatable {
  final UserResponseStatus status;
  final Users user;
  final String message;

  const UserState({
    this.status = UserResponseStatus.initial,
    this.user = const Users(),
    this.message = '',
  });

  UserState copyWith({
    UserResponseStatus? status,
    Users? user,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, user, message];
}
