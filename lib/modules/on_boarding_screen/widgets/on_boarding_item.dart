import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
        required this.title,
        required this.image,
        required this.description});
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: size.width * 0.8,
              height: size.height * 0.5,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              color: MyColors.primary,
              fontSize: size.height * 0.025,
              fontWeight: FontWeight.w700,
              fontFamily: FontRes.INTER_18PT_BOLD,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            style: TextStyle(
              color: MyColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: FontRes.INTER_18PT_SEMIBOLD,
            ),
          ),
        ),
      ],
    );
  }
}