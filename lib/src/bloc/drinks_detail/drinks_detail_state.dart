part of 'drinks_detail_bloc.dart';

class DrinksDetailState extends Equatable {
  //Quantity Counter
  final int quantity;
  final int price;
  //Select Size
  final String selectedSize;
  final String selectedDrinks;

  DrinksDetailState({
    this.selectedSize = 'S',
    this.selectedDrinks = 'All',
    this.quantity = 1,
    this.price = 0,
  });

  DrinksDetailState copyWith({
    String? selectedSize,
    String? selectedDrinks,
    int? quantity,
    int? price,
  }) {
    return DrinksDetailState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedDrinks: selectedDrinks ?? this.selectedDrinks,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [selectedSize, selectedDrinks, quantity, price];
}
