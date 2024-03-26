import 'package:coffee_shop_app/src/pages/welcome/welcome_page.dart';
import 'package:coffee_shop_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final navigatorState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            textTheme: GoogleFonts.soraTextTheme(
              Theme.of(context).textTheme,
            )),
        home: WelcomePage(),
        routes: AppRoute.all,
        navigatorKey: navigatorState,
      ),
    );
  }
}
