import 'package:evently_app/core/extensions/validations.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../core/services/firebase_auth_services.dart';
import '../../core/widgets/custom_text_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'register';

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
          onPressed: () {
            Navigator.pop(context);
          },
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
                CustomTextField(
                  edgeInsets: const EdgeInsets.symmetric(vertical: 18.0),
                  controller: nameController,
                  label: 'Name',
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.person, color: MyColors.gray),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: size.height * 0.02),
                CustomTextField(
                  edgeInsets: const EdgeInsets.symmetric(vertical: 18.0),
                  controller: emailController,
                  label: 'Email',
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!Validations.validateEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.email, color: MyColors.gray),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  controller: passwordController,
                  obscureText: !_isPasswordVisible, // إخفاء أو إظهار كلمة المرور
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: MyColors.gray),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: MyColors.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: MyColors.gray, width: 1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: size.height * 0.02),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: !_isPasswordVisible, // إخفاء أو إظهار كلمة المرور
                  decoration: InputDecoration(
                    labelText: 'Re-enter Password',
                    prefixIcon: Icon(Icons.lock, color: MyColors.gray),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: MyColors.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: MyColors.gray, width: 1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: size.height * 0.025),
                CustomButton(
                  onTab: () async {
                    if (!formKey.currentState!.validate()) return;

                    EasyLoading.show(status: 'Creating account...');
                    try {
                      bool isSuccess = await FirebaseAuthService.createAccount(
                        emailController.text,
                        passwordController.text,
                      );
                      EasyLoading.dismiss();
                      if (isSuccess) {
                        Navigator.pop(context);
                      } else {
                        EasyLoading.showError('Registration failed. Try again.');
                      }
                    } catch (e) {
                      EasyLoading.dismiss();
                      EasyLoading.showError('Error: ${e.toString()}');
                    }
                  },
                  title: 'Create Account',
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: size.height * 0.021,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
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
    return IconButton(
      icon: Icon(
        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: MyColors.gray,
      ),
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}
