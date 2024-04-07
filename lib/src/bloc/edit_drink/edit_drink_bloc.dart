import 'dart:async';

import 'package:coffee_shop_app/src/models/cart_items_response';
import 'package:coffee_shop_app/src/service/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_drink_event.dart';
part 'edit_drink_state.dart';

class EditDrinkBloc extends Bloc<EditDrinkEvent, EditDrinkState> {
  final ApiRepository _apiRepository = ApiRepository();
  EditDrinkBloc() : super(const EditDrinkState()) {
    on<FetchDrinkData>(fetchDrinkData);
    on<SelectSizeOptions>(selectSizeOptions);
    on<AddQuantityCounter>(addQuantityCounter);
    on<MinusQuantityCounter>(minusQuantityCounter);
    on<UpdateSubmitted>(updateSubmitted);
    on<DeleteSubmitted>(deleteSubmitted);
    on<ClearState>(clearState);
  }
  void selectSizeOptions(
      SelectSizeOptions event, Emitter<EditDrinkState> emit) {
    emit(state.copyWith(selectedSize: event.option));
  }

  void addQuantityCounter(
      AddQuantityCounter event, Emitter<EditDrinkState> emit) {
    emit(state.copyWith(quantity: state.quantity + 1));
    emit(state.copyWith(price: event.price * state.quantity));
  }

  void minusQuantityCounter(
      MinusQuantityCounter event, Emitter<EditDrinkState> emit) {
    emit(state.copyWith(quantity: state.quantity - 1));
    if (state.quantity == 0) {
      emit(state.copyWith(price: 0, quantity: 0));
    } else {
      emit(state.copyWith(price: event.price * state.quantity));
    }
  }

  void fetchDrinkData(FetchDrinkData event, Emitter<EditDrinkState> emit) {
    emit(state.copyWith(
        selectedSize: event.drink.size,
        quantity: event.drink.qty,
        price: event.drink.totalPrice));
  }

  FutureOr<void> updateSubmitted(
      UpdateSubmitted event, Emitter<EditDrinkState> emit) async {
    final result = await _apiRepository.updateCartItems(
        event.cartItemId, event.size, event.qty);
    if (result.status == "200") {
      emit(state.copyWith(updateStatus: UpdateDrinkStatus.success));
    } else {
      emit(state.copyWith(updateStatus: UpdateDrinkStatus.failure));
    }
  }

  void clearState(ClearState event, Emitter<EditDrinkState> emit) {
    emit(state.copyWith(
        updateStatus: UpdateDrinkStatus.initial,
        deleteStatus: DeleteDrinkStatus.initial));
  }

  FutureOr<void> deleteSubmitted(
      DeleteSubmitted event, Emitter<EditDrinkState> emit) async {
    final result = await _apiRepository.deleteCartItems(event.cartItemId);
    if (result.status == "200") {
      emit(state.copyWith(deleteStatus: DeleteDrinkStatus.success));
    } else {
      emit(state.copyWith(deleteStatus: DeleteDrinkStatus.failure));
    }
  }
}
