import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/validator/validator.dart';
import '../../service/api_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ApiRepository apiRepository = ApiRepository();
  SignUpBloc() : super(SignUpState()) {
    //Name updated
    on<SignUpNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    //Email updated
    on<SignUpEmailChanged>((event, emit) {
      emit(state.copyWith(name: event.email));
    });
    //Password updated
    on<SignUpPasswordChanged>((event, emit) {
      emit(state.copyWith(name: event.password));
    });

    //Submitted SignUp Button
    on<SignUpSubmitted>((event, emit) async {
      final result =
          await apiRepository.signUp(event.name, event.email, event.password);
      switch (result.status) {
        case "401":
          emit(state.copyWith(
              status: SignUpStatus.failure, message: result.message));
        case "201":
          emit(state.copyWith(
              status: SignUpStatus.success, message: result.message));
      }
    });

    on<SignUpClearState>((event, emit) {
      emit(state.copyWith(status: SignUpStatus.initial, message: ''));
    });
  }
}
