
import 'package:evently_app/core/routs/pages_route_name.dart';
=======
import 'package:evently_app/core/extensions/validations.dart';
import 'package:evently_app/core/utils/firebase_function.dart';

import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_text_form.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.black,
            size: size.height * 0.03,
          ),
        ),
        title: Text(
          'Register',
          style: TextStyle(
            color: MyColors.black,
            fontSize: size.height * 0.028,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: size.height * 0.27,
                  ),
                ),
                CustomTextForm(
                    controller: nameController,
                    hintText: 'Name',
                    validator: (value)
                    {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImageIcon(
                        AssetImage(
                          'assets/icons/personIcon.png',
                        ),
                        color: MyColors.gray,
                        size: size.height * 0.02,
                      ),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextForm(
                  controller: emailController,
                  hintText: 'Email',
                  validator: (value)
                  {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!Validations.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage(
                        'assets/icons/mailIcon.png',
                      ),
                      color: MyColors.gray,
                      size: size.height * 0.02,
                    ),
                  ),
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextForm(
                  controller: passwordController,
                  hintText: 'Password',
                  validator: (value)
                  {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // if (!Validations.isPassword(value)) {
                    //   return 'Please enter a valid password';
                    // }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage(
                        'assets/icons/passIcon.png',
                      ),
                      color: MyColors.gray,
                      size: size.height * 0.02,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: ImageIcon(
                      AssetImage(
                        _isPasswordVisible
                            ? 'assets/icons/eyeSlashIIcon.png'
                            : 'assets/icons/eyeSlashIIcon.png',
                      ),
                      color: MyColors.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextForm(
                  controller: rePasswordController,
                  hintText: 'Re Password',
                  validator: (value)
                  {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage(
                        'assets/icons/passIcon.png',
                      ),
                      color: MyColors.gray,
                      size: size.height * 0.02,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: ImageIcon(
                      AssetImage(
                        _isPasswordVisible
                            ? 'assets/icons/eyeSlashIIcon.png'
                            : 'assets/icons/eyeSlashIIcon.png',
                      ),
                      color: MyColors.gray,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                CustomButton(

                    onTab: (){},
                    title: 'Create Account',=======

                    onPressed: ()
                    {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }
                      FirebaseFunction.createAccount(
                        emailController.text,
                        passwordController.text,
                      ).then((value)
                      {
                        EasyLoading.dismiss();
                        if (value == true)
                        {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        }
                      });
                    },
                    text: 'Create Account',

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account',
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontRes.INTER_18PT_SEMIBOLD,
                        ),
                      ),
                      TextButton(
                        onPressed: ()
                        {
                          navigatorKey.currentState!
                              .pushNamed(PagesRouteName.signIn);

                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: size.height * 0.021,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            decorationColor: MyColors.primary,
                            fontFamily: FontRes.INTER_18PT_BOLDITALIC,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildVisibilityToggle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: ImageIcon(
          AssetImage(
            _isPasswordVisible
                ? 'assets/icons/eyeSlashIIcon.png'
                : 'assets/icons/eyeSlashIIcon.png',
          ),
          color: MyColors.gray,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }
}
