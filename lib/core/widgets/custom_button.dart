import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
   final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        minimumSize: Size(size.width * 0.8, size.height * 0.06),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: MyColors.white,
          fontSize: size.height * 0.03,
          fontWeight: FontWeight.w500,
          fontFamily: FontRes.INTER_18PT_REGULAR,
        ),
      ),
    );
  }
}
