import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_text_form.dart';
import 'package:evently_app/modules/login_screen/login_screen.dart';
import 'package:evently_app/res/font_res.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String routeName = 'register';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                    onPressed: () {  },
                    icon:ImageIcon(
                      AssetImage(
                        'assets/icons/eyeSlashIIcon.png',
                      ),
                      color: MyColors.gray,
                      size: size.height * 0.032,
                    ),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextForm(
                  controller: passwordController,
                  hintText: 'Re Password',

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
                    onPressed: () {  },
                    icon:ImageIcon(
                      AssetImage(
                        'assets/icons/eyeSlashIIcon.png',
                      ),
                      color: MyColors.gray,
                      size: size.height * 0.032,
                    ),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                CustomButton(
                    onPressed: (){},
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
                          Navigator.pushNamed(context, LoginScreen.routeName);
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
}
