part of 'drinks_detail_bloc.dart';

class DrinksDetailState extends Equatable {
  final String selectedSize;
  final String selectedDrinks;

  DrinksDetailState({
    this.selectedSize = 'S',
    this.selectedDrinks = 'All',
  });

  DrinksDetailState copyWith({
    String? selectedSize,
    String? selectedDrinks,
  }) {
    return DrinksDetailState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedDrinks: selectedDrinks ?? this.selectedDrinks,
    );
  }

  @override
  List<Object?> get props => [selectedSize, selectedDrinks];
}
