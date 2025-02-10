import 'package:evently_app/core/routs/pages_route_name.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/main.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigatorKey.currentState!
                .pushNamed(PagesRouteName.signIn);

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
              onTab: () {},
              title: 'Reset Password',
            ),
          ),
        ],
      ),
    );
  }
}
