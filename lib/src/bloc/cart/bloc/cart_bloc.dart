import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:coffee_shop_app/src/service/api_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ApiRepository _apiRepository = ApiRepository();
  CartBloc() : super(CartState()) {
    on<CartItemAddedEvent>(cartItemAdded);
    on<CartItemAddedClearState>(clearCartItemAddedState);
    on<CartItemGetEvent>(getCartItesm);
  }

  FutureOr<void> cartItemAdded(
      CartItemAddedEvent event, Emitter<CartState> emit) async {
    final result =
        await _apiRepository.cartAdded(event.drinkId, event.size, event.qty);
    switch (result.status) {
      case "200":
        emit(state.copyWith(cartAddedStatus: CartAddedStatus.success));
        break;
      case "400":
        emit(state.copyWith(cartAddedStatus: CartAddedStatus.failure));
        break;
      case "500":
        emit(state.copyWith(cartAddedStatus: CartAddedStatus.failure));
        break;
    }
  }

  void clearCartItemAddedState(
      CartItemAddedClearState event, Emitter<CartState> emit) {
    emit(state.copyWith(cartAddedStatus: CartAddedStatus.initial));
  }

  FutureOr<void> getCartItesm(
      CartItemGetEvent event, Emitter<CartState> emit) async {
    final result = await _apiRepository.getCartItems();
    print(result.badge);
    if (result.status == '200') {
      emit(state.copyWith(badge: result.badge));
    } else {
      throw Exception("Failed to fetch CartItems at (cart_bloc)");
    }
  }
}
