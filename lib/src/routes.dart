import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';
import 'pages/welcome/welcome_page.dart';

class AppRoute {
  static const home = 'home';
  static const welcome = 'welcome';

  static get all => <String, WidgetBuilder>{
        welcome: (context) => const WelcomePage(),
        home: (context) => const HomePage(),
      };
}
