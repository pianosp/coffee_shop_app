part of 'bottom_navigation_bar_bloc.dart';

enum NavbarItem { home, order, inbox, settings }

class BottomNavigationBarState extends Equatable {
  final NavbarItem navbarItem;
  final int tabIndex;
  const BottomNavigationBarState({
    this.tabIndex = 0,
    this.navbarItem = NavbarItem.home,
  });

  BottomNavigationBarState copyWith({
    int? tabIndex,
    NavbarItem? navbarItem,
  }) {
    return BottomNavigationBarState(
      tabIndex: tabIndex ?? this.tabIndex,
      navbarItem: navbarItem ?? this.navbarItem,
    );
  }

  @override
  List<Object?> get props => [tabIndex, navbarItem];
}
