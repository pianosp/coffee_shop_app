import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drinks_detail_event.dart';
part 'drinks_detail_state.dart';

class DrinksDetailBloc extends Bloc<DrinksDetailEvent, DrinksDetailState> {
  DrinksDetailBloc() : super(DrinksDetailState()) {
    on<SelectSizeOptions>(selectSizeOptions);
    on<SelectDrinksOptions>(selectDrinksOptions);
  }
  void selectSizeOptions(
      SelectSizeOptions event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(selectedSize: event.option));
  }

  void selectDrinksOptions(
      SelectDrinksOptions event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(selectedDrinks: event.drinkOption));
  }
}
