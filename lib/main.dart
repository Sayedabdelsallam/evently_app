import 'package:evently_app/layout/home_layout.dart';
import 'package:flutter/material.dart';

import 'modules/splash_screen/splash_screen.dart';
import 'core/helper_functions/on_generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}


