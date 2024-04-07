import 'package:coffee_shop_app/src/service/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cart_items_response';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ApiRepository _apiRepository = ApiRepository();
  CartBloc() : super(CartState()) {
    on<CartItemAddedEvent>(cartItemAdded);
    on<CartItemAddedClearState>(clearCartItemAddedState);
    on<CartItemGetEvent>(getCartItems);
  }

  Future<void> cartItemAdded(
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

  Future<void> getCartItems(
      CartItemGetEvent event, Emitter<CartState> emit) async {
    await _apiRepository.getCartItems().then((value) {
      emit(state.copyWith(
        badge: value.badge,
        cartItems: value.data,
        cartItemsStatus: CartItemsStatus.success,
        totalPrice: value.total,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(cartItemsStatus: CartItemsStatus.failure));
    });
  }
}
