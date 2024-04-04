part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();
  @override
  List<Object> get props => [];
}

class BottomNavigationBarOnTap extends BottomNavigationBarEvent {
  final NavbarItem navbarItem;

  BottomNavigationBarOnTap(this.navbarItem);
}
