import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      this.suffixIcon,
      this.validator,
      this.onValidate,
      this.prefixIcon,
      required this.keyboardType});
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Function? onValidate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize:size.height * 0.02,
          color: MyColors.gray,
          fontFamily: FontRes.INTER_18PT_SEMIBOLD,
        ),
      ),
    );
  }
}
