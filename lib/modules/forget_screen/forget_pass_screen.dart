import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/modules/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});
  static const String routeName = 'forget';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: size.height * 0.03,
          ),
        ),
        title: Text(
          'Forget Password',
          style: TextStyle(
            color: MyColors.black,
            fontSize: size.height * 0.028,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/forget_pass.png',
            height: size.height * 0.4,
          ),
          SizedBox(
            height: size.height * 0.0225,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              onPressed: () {},
              text: 'Reset Password',
            ),
          ),
        ],
      ),
    );
  }
}
