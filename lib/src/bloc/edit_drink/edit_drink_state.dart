part of 'edit_drink_bloc.dart';

enum UpdateDrinkStatus { initial, success, failure }

enum DeleteDrinkStatus { initial, success, failure }

class EditDrinkState extends Equatable {
  //Quantity Counter
  final UpdateDrinkStatus updateStatus;
  final DeleteDrinkStatus deleteStatus;
  final int quantity;
  final int price;
  //Select Size
  final String selectedSize;

  const EditDrinkState({
    this.updateStatus = UpdateDrinkStatus.initial,
    this.deleteStatus = DeleteDrinkStatus.initial,
    this.selectedSize = 'S',
    this.quantity = 1,
    this.price = 0,
  });

  EditDrinkState copyWith({
    UpdateDrinkStatus? updateStatus,
    DeleteDrinkStatus? deleteStatus,
    String? selectedSize,
    int? quantity,
    int? price,
  }) {
    return EditDrinkState(
      updateStatus: updateStatus ?? this.updateStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      selectedSize: selectedSize ?? this.selectedSize,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object> get props =>
      [selectedSize, quantity, price, updateStatus, deleteStatus];
}
