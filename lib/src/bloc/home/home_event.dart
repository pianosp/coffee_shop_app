part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetAllDrinksList extends HomeEvent {}

class FilterDrinksList extends HomeEvent {
  final String type;

  FilterDrinksList(this.type);
}
