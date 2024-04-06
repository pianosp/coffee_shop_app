part of 'cart_bloc.dart';

enum CartAddedStatus { initial, success, failure }

class CartState extends Equatable {
  final CartAddedStatus cartAddedStatus;

  final int badge;

  const CartState(
      {this.cartAddedStatus = CartAddedStatus.initial, this.badge = 0});

  CartState copyWith({
    CartAddedStatus? cartAddedStatus,
    int? badge,
  }) {
    return CartState(
      cartAddedStatus: cartAddedStatus ?? this.cartAddedStatus,
      badge: badge ?? this.badge,
    );
  }

  @override
  List<Object> get props => [cartAddedStatus, badge];
}
