part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartItemAddedEvent extends CartEvent {
  final int drinkId;
  final String size;
  final int qty;

  CartItemAddedEvent(this.drinkId, this.size, this.qty);
}

class CartItemAddedClearState extends CartEvent {}

class CartItemGetEvent extends CartEvent {}
