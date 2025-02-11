
import 'package:evently_app/core/routs/app_routs.dart';
=======
import 'package:bot_toast/bot_toast.dart';
import 'package:evently_app/core/services/loading_services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'firebase_options.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {

  WidgetsFlutterBinding.ensureInitialized();



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

      navigatorKey: navigatorKey,
      onGenerateRoute: AppRoutes.onGeneratedRoute,

      initialRoute: SplashScreen.routeName,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}


