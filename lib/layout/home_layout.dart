import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        leading: SizedBox(),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back ✨',
              style: TextStyle(
                color: MyColors.white,
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w400,
                fontFamily: FontRes.INTER_18PT_REGULAR,
              ),
            ),
            Text(
              'Sayed Abd Elsllam',
              style: TextStyle(
                color: MyColors.white,
                fontSize: size.height * 0.03,
                fontWeight: FontWeight.w700,
                fontFamily: FontRes.INTER_18PT_BOLD,
              ),
            ),
          ],
        ),

      ),
    );
  }
}
