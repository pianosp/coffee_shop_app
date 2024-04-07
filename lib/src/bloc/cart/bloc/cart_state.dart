part of 'cart_bloc.dart';

enum CartAddedStatus { initial, success, failure }

enum CartItemsStatus { initial, success, failure }

class CartState extends Equatable {
  final CartAddedStatus cartAddedStatus;
  final CartItemsStatus cartItemsStatus;
  final List<Datum> cartItems;
  final int badge;
  final int totalPrice;

  const CartState({
    this.cartAddedStatus = CartAddedStatus.initial,
    this.cartItemsStatus = CartItemsStatus.initial,
    this.badge = 0,
    this.totalPrice = 0,
    this.cartItems = const <Datum>[],
  });

  CartState copyWith({
    CartAddedStatus? cartAddedStatus,
    CartItemsStatus? cartItemsStatus,
    List<Datum>? cartItems,
    int? badge,
    int? totalPrice,
  }) {
    return CartState(
      cartAddedStatus: cartAddedStatus ?? this.cartAddedStatus,
      cartItemsStatus: cartItemsStatus ?? this.cartItemsStatus,
      cartItems: cartItems ?? this.cartItems,
      badge: badge ?? this.badge,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object> get props =>
      [cartAddedStatus, badge, cartItems, cartItemsStatus, totalPrice];
}
