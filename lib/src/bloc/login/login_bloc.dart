import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service/api_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository apiRepository = ApiRepository();
  LoginBloc() : super(const LoginState()) {
    //Email updated
    on<LoginEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    //Password updated
    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    //Handle Login submitted
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.loading));
      final result = await apiRepository.login(event.email, event.password);
      switch (result.status) {
        case "200":
          emit(state.copyWith(
              status: LoginStatus.success, message: result.message));
        case "401":
          emit(state.copyWith(
              status: LoginStatus.failure, message: result.message));
      }
    });

    on<LoginClearState>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.initial, message: ''));
    });
  }
}
