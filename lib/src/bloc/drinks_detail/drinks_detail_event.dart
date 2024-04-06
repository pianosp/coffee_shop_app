part of 'drinks_detail_bloc.dart';

abstract class DrinksDetailEvent extends Equatable {
  const DrinksDetailEvent();
  @override
  List<Object> get props => [];
}

class SelectSizeOptions extends DrinksDetailEvent {
  final String option;

  SelectSizeOptions(this.option);
}

class SelectDrinksOptions extends DrinksDetailEvent {
  final String drinkOption;

  SelectDrinksOptions(this.drinkOption);
}

class AddQuantityCounter extends DrinksDetailEvent {
  final int price;
  AddQuantityCounter(this.price);
}

class MinusQuantityCounter extends DrinksDetailEvent {
  final int price;
  MinusQuantityCounter(this.price);
}
