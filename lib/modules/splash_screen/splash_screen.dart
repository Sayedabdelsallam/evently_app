
import 'package:evently_app/core/routs/pages_route_name.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigatorKey.currentState!
          .pushNamed(PagesRouteName.layout);

    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset('assets/images/Logo.png',
              height: size.height * 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
