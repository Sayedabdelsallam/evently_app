import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/services/loading_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';
import 'modules/splash_screen/splash_screen.dart';
import 'core/helper_functions/on_generate_route.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}


