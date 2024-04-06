import 'dart:async';

import 'package:coffee_shop_app/src/models/drinks_model.dart';
import 'package:coffee_shop_app/src/service/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiRepository apiRepository = ApiRepository();
  List<DrinksModel> tempDrinkList = [];
  HomeBloc() : super(HomeState()) {
    on<GetAllDrinksList>(fetchAllDrinksList);
    on<FilterDrinksList>(_filterDrinksList);
  }
  FutureOr<void> fetchAllDrinksList(
      GetAllDrinksList event, Emitter<HomeState> emit) async {
    await apiRepository.getAllDrinks().then((value) {
      emit(state.copyWith(
        status: HomeStatus.success,
        drinksList: value,
        message: 'success',
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          status: HomeStatus.failure, message: error.toString()));
    });
  }

  void _filterDrinksList(FilterDrinksList event, Emitter<HomeState> emit) {
    if (event.type == 'All') {
      tempDrinkList = state.drinksList.toList();
      emit(state.copyWith(tempDrinksList: tempDrinkList));
    }
    tempDrinkList = state.drinksList
        .where((element) => element.type.toString() == event.type)
        .toList();
    emit(state.copyWith(tempDrinksList: tempDrinkList));
  }
}
