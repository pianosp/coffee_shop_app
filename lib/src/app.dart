import 'package:coffee_shop_app/src/bloc/login/login_bloc.dart';
import 'package:coffee_shop_app/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:coffee_shop_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/bottom_navbar/bottom_navigation_bar_bloc.dart';
import 'bloc/drinks_detail/drinks_detail_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'pages/navigation/navigation_page.dart';

final navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider(create: (context) => HomeBloc());
    final drinksDetailBloc =
        BlocProvider(create: (context) => DrinksDetailBloc());
    final signupBloc = BlocProvider(create: (context) => SignUpBloc());
    final loginBloc = BlocProvider(create: (context) => LoginBloc());
    final bottomNavBar =
        BlocProvider(create: (context) => BottomNavigationBarBloc());

    return MultiBlocProvider(
      providers: [
        homeBloc,
        drinksDetailBloc,
        signupBloc,
        loginBloc,
        bottomNavBar
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              textTheme: GoogleFonts.soraTextTheme(
                Theme.of(context).textTheme,
              )),
          home: NavigationPage(),
          routes: AppRoute.all,
          navigatorKey: navigatorState,
        ),
      ),
    );
  }
}
