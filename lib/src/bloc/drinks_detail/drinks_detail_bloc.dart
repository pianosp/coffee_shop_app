import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drinks_detail_event.dart';
part 'drinks_detail_state.dart';

class DrinksDetailBloc extends Bloc<DrinksDetailEvent, DrinksDetailState> {
  DrinksDetailBloc() : super(DrinksDetailState()) {
    on<SelectSizeOptions>(selectSizeOptions);
    on<SelectDrinksOptions>(selectDrinksOptions);
    on<AddQuantityCounter>(addQuantityCounter);
    on<MinusQuantityCounter>(minusQuantityCounter);
  }
  void selectSizeOptions(
      SelectSizeOptions event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(selectedSize: event.option));
  }

  void selectDrinksOptions(
      SelectDrinksOptions event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(selectedDrinks: event.drinkOption));
  }

  void addQuantityCounter(
      AddQuantityCounter event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void minusQuantityCounter(
      MinusQuantityCounter event, Emitter<DrinksDetailState> emit) {
    emit(state.copyWith(quantity: state.quantity - 1));
  }
}
