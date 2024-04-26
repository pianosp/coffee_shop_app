part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DrinksModel> allDrinksList;
  final List<DrinksModel> drinksList;
  final List<DrinksModel> tempDrinksList;
  final String message;

  HomeState({
    this.status = HomeStatus.initial,
    this.allDrinksList = const <DrinksModel>[],
    this.drinksList = const <DrinksModel>[],
    this.tempDrinksList = const <DrinksModel>[],
    this.message = "",
  });s

  HomeState copyWith({
    HomeStatus? status,
    List<DrinksModel>? allDrinksList,
    List<DrinksModel>? drinksList,
    List<DrinksModel>? tempDrinksList,
    String? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      allDrinksList: allDrinksList ?? this.allDrinksList,
      drinksList: drinksList ?? this.drinksList,
      tempDrinksList: tempDrinksList ?? this.tempDrinksList,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $message, posts: ${drinksList.length} }''';
  }

  @override
  List<Object> get props =>
      [status, drinksList, message, tempDrinksList, allDrinksList];
}
