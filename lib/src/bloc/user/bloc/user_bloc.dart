import 'dart:async';
import 'package:coffee_shop_app/src/service/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_response.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiRepository _apiRepository = ApiRepository();
  UserBloc() : super(const UserState()) {
    on<UserFetchEvent>(userFetchData);
  }

  FutureOr<void> userFetchData(
      UserFetchEvent event, Emitter<UserState> emit) async {
    final result = await _apiRepository.getUsers();
    switch (result.status) {
      case "200":
        emit(state.copyWith(user: result.users, message: result.message));
        break;
      case "404":
        emit(state.copyWith(message: result.message));
        break;
    }
  }
}
