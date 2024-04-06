import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/bloc/bottom_navbar/bottom_navigation_bar_bloc.dart';

Widget buildBottomNavBar(BottomNavigationBarState state, BuildContext context) {
  return BottomNavigationBar(
    currentIndex: state.tabIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.access_time_filled,
        ),
        label: 'Order',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'Settings',
      ),
    ],
    onTap: (index) {
      switch (index) {
        case 0:
          context
              .read<BottomNavigationBarBloc>()
              .add(BottomNavigationBarOnTap(NavbarItem.home));
          break;
        case 1:
          context
              .read<BottomNavigationBarBloc>()
              .add(BottomNavigationBarOnTap(NavbarItem.order));
          break;
        case 2:
          context
              .read<BottomNavigationBarBloc>()
              .add(BottomNavigationBarOnTap(NavbarItem.settings));
          break;
      }
    },
  );
}
