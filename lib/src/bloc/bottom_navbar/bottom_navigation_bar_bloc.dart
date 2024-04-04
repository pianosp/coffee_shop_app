import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarState()) {
    on<BottomNavigationBarOnTap>((event, emit) {
      switch (event.navbarItem) {
        case NavbarItem.home:
          emit(state.copyWith(navbarItem: NavbarItem.home, tabIndex: 0));
          break;
        case NavbarItem.order:
          emit(state.copyWith(navbarItem: NavbarItem.order, tabIndex: 1));
          break;
        case NavbarItem.inbox:
          emit(state.copyWith(navbarItem: NavbarItem.inbox, tabIndex: 2));
          break;
        case NavbarItem.settings:
          emit(state.copyWith(navbarItem: NavbarItem.settings, tabIndex: 3));
          break;
      }
    });
  }
}
