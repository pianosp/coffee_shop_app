part of 'edit_drink_bloc.dart';

abstract class EditDrinkEvent extends Equatable {
  const EditDrinkEvent();

  @override
  List<Object> get props => [];
}

class FetchDrinkData extends EditDrinkEvent {
  final Datum drink;

  FetchDrinkData(this.drink);
}

class SelectSizeOptions extends EditDrinkEvent {
  final String option;

  SelectSizeOptions(this.option);
}

class AddQuantityCounter extends EditDrinkEvent {
  final int price;
  AddQuantityCounter(this.price);
}

class MinusQuantityCounter extends EditDrinkEvent {
  final int price;
  MinusQuantityCounter(this.price);
}

class UpdateSubmitted extends EditDrinkEvent {
  final int cartItemId;
  final String size;
  final int qty;

  UpdateSubmitted(this.cartItemId, this.size, this.qty);
}

class DeleteSubmitted extends EditDrinkEvent {
  final int cartItemId;
  DeleteSubmitted(this.cartItemId);
}

class ClearState extends EditDrinkEvent {}
