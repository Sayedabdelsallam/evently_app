import 'package:evently_app/modules/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../../layout/home_layout.dart';
import '../../modules/forget_screen/forget_pass_screen.dart';
import '../../modules/login_screen/login_screen.dart';
import '../../modules/on_boarding_screen/on_boarding_screen.dart';
import '../../modules/splash_screen/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeLayout.routeName:
      return MaterialPageRoute(builder: (_) => HomeLayout());
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case ForgetPassScreen.routeName:
      return MaterialPageRoute(builder: (_) => ForgetPassScreen());
      case RegisterScreen.routeName:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}