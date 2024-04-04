import 'package:coffee_shop_app/src/pages/inbox/inbox_page.dart';
import 'package:coffee_shop_app/src/pages/order/order_page.dart';
import 'package:coffee_shop_app/src/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../common/values/colors.dart';
import '../../bloc/bottom_navbar/bottom_navigation_bar_bloc.dart';
import '../home/home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.botttomNavShadow.withOpacity(0.25),
                    blurRadius: 24,
                    spreadRadius: 0,
                    offset: Offset(0, -10), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                border: Border.all(
                    width: 2,
                    color: AppColors.botttomNavBorder,
                    strokeAlign: BorderSide.strokeAlignInside)),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 25.w, right: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.home,
                          size: 35.0,
                          color: state.navbarItem == NavbarItem.home
                              ? AppColors.primaryElement
                              : AppColors.disableNavIcon,
                        ),
                        onPressed: () {
                          context.read<BottomNavigationBarBloc>().add(
                                BottomNavigationBarOnTap(NavbarItem.home),
                              );
                        },
                      ),
                      Container(
                        width: 10.w,
                        height: 5.w,
                        decoration: state.navbarItem == NavbarItem.home
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    HexColor("#EDAB81"), // Bottom left color
                                    HexColor("#C67C4E"), // Top right color
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(18.r),
                              )
                            : null,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.access_time_filled,
                          size: 30.0,
                          color: state.navbarItem == NavbarItem.order
                              ? AppColors.primaryElement
                              : AppColors.disableNavIcon,
                        ),
                        onPressed: () {
                          context.read<BottomNavigationBarBloc>().add(
                                BottomNavigationBarOnTap(NavbarItem.order),
                              );
                        },
                      ),
                      Container(
                        width: 10.w,
                        height: 5.w,
                        decoration: state.navbarItem == NavbarItem.order
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    HexColor("#EDAB81"), // Bottom left color
                                    HexColor("#C67C4E"), // Top right color
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(18.r),
                              )
                            : null,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          size: 30.0,
                          color: state.navbarItem == NavbarItem.inbox
                              ? AppColors.primaryElement
                              : AppColors.disableNavIcon,
                        ),
                        onPressed: () {
                          context.read<BottomNavigationBarBloc>().add(
                                BottomNavigationBarOnTap(NavbarItem.inbox),
                              );
                        },
                      ),
                      Container(
                        width: 10.w,
                        height: 5.w,
                        decoration: state.navbarItem == NavbarItem.inbox
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    HexColor("#EDAB81"), // Bottom left color
                                    HexColor("#C67C4E"), // Top right color
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(18.r),
                              )
                            : null,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          size: 30.0,
                          color: state.navbarItem == NavbarItem.settings
                              ? AppColors.primaryElement
                              : AppColors.disableNavIcon,
                        ),
                        onPressed: () {
                          context.read<BottomNavigationBarBloc>().add(
                                BottomNavigationBarOnTap(NavbarItem.settings),
                              );
                        },
                      ),
                      Container(
                        width: 10.w,
                        height: 5.w,
                        decoration: state.navbarItem == NavbarItem.settings
                            ? BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    HexColor("#EDAB81"), // Bottom left color
                                    HexColor("#C67C4E"), // Top right color
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(18.r),
                              )
                            : null,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
          builder: (context, state) {
        switch (state.navbarItem) {
          case NavbarItem.home:
            return const HomePage();
          case NavbarItem.order:
            return const OrderPage();
          case NavbarItem.inbox:
            return const InboxPage();
          case NavbarItem.settings:
            return const SettingPage();
          default:
            return Container();
        }
      }),
    );
  }
}
