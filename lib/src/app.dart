import 'package:coffee_shop_app/src/pages/login/login_page.dart';
import 'package:coffee_shop_app/src/pages/welcome/welcome_page.dart';
import 'package:coffee_shop_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/drinks_detail/drinks_detail_bloc.dart';
import 'bloc/home/home_bloc.dart';

final navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider(create: (context) => HomeBloc());
    final drinksDetailBloc =
        BlocProvider(create: (context) => DrinksDetailBloc());
    return MultiBlocProvider(
      providers: [homeBloc, drinksDetailBloc],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              textTheme: GoogleFonts.soraTextTheme(
                Theme.of(context).textTheme,
              )),
          home: LoginPage(),
          routes: AppRoute.all,
          navigatorKey: navigatorState,
        ),
      ),
    );
  }
}
