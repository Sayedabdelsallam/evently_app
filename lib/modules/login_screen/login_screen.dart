import 'package:evently_app/core/routs/pages_route_name.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/core/widgets/custom_text_form.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/services/firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/Logo.png',
                  height: size.height * 0.22,
                ),
                SizedBox(height: size.height * 0.035),

                /// **Email Field**
                CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: _buildIcon('assets/icons/mailIcon.png'),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: size.height * 0.02),

                /// **Password Field**
                CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  isPassword: !_isPasswordVisible, // يجعل الحقل مخفيًا
                  prefixIcon: _buildIcon('assets/icons/passIcon.png'),
                  suffixWidget: _buildVisibilityToggle(),
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),

                SizedBox(height: size.height * 0.015),

                /// **Forgot Password**
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      navigatorKey.currentState!
                          .pushNamed(PagesRouteName.forgetPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: _linkTextStyle(),
                    ),
                  ),
                ),

                /// **Login Button**
                CustomButton(
                  onTab: _login,
                  title: 'Login',
                ),

                /// **Register Navigation**
                _buildRegisterRow(size),

                /// **Divider**
                _buildDivider(size),

                /// **Google Login**
                _buildGoogleLoginButton(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **Icon Builder**
  Widget _buildIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageIcon(
        AssetImage(assetPath),
        color: MyColors.gray,
      ),
    );
  }

  /// **Password Visibility Toggle**
  Widget _buildVisibilityToggle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: ImageIcon(
          AssetImage(
            _isPasswordVisible
                ? 'assets/icons/eyeIcon.png' // Corrected for visible password icon
                : 'assets/icons/eyeSlashIIcon.png', // Corrected for hidden password icon
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

  /// **Login Logic**
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Perform Firebase login
      FirebaseAuthService.loginAccount(
        _emailController.text,
        _passwordController.text,
      ).then((value) {
        EasyLoading.dismiss();
        if (value == true) {
          Navigator.pushNamed(context, PagesRouteName.layout);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed, try again!')),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid credentials')),
      );
    }
  }

  /// **Text Style for Links**
  TextStyle _linkTextStyle() {
    return TextStyle(
      color: MyColors.primary,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
      decorationColor: MyColors.primary,
      fontFamily: FontRes.INTER_18PT_BOLDITALIC,
    );
  }

  /// **Register Row**
  Widget _buildRegisterRow(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(
              color: MyColors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: FontRes.INTER_18PT_SEMIBOLD,
            ),
          ),
          TextButton(
            onPressed: () {
              navigatorKey.currentState!
                  .pushNamed(PagesRouteName.signUp);
            },
            child: Text(
              'Create Account',
              style: _linkTextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  /// **Divider Row**
  Widget _buildDivider(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(child: _dividerLine()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Or',
              style: TextStyle(
                color: MyColors.primary,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                fontFamily: FontRes.INTER_18PT_SEMIBOLD,
              ),
            ),
          ),
          Expanded(child: _dividerLine()),
        ],
      ),
    );
  }

  /// **Single Divider Line**
  Widget _dividerLine() {
    return Divider(
      color: MyColors.primary,
      thickness: 2.0,
    );
  }

  /// **Google Sign-In Button**
  Widget _buildGoogleLoginButton(Size size) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        minimumSize: Size(size.width * 0.8, size.height * 0.06),
        side: BorderSide(color: MyColors.primary),
      ),
      onPressed: () {

        FirebaseAuthService.signInWithGoogle();
        EasyLoading.dismiss();

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/googleIcon.png'),
          SizedBox(width: 10),
          Text(
            'Continue with Google',
            style: TextStyle(
              color: MyColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: FontRes.INTER_18PT_SEMIBOLD,
            ),
          ),
        ],
      ),
    );
  }
}
