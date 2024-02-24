import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/auth_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/helper/constants/custom_textfield2.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';
import 'package:nbatrade/view/auth/forget_password.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/widgets/auth_header.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.controller});
  final AuthController controller;


  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: _formKey1,
              child: Column(
                children: [
                  const AuthHeader(),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.0, vertical: 4.0),
                    child: CustomTextWidget(
                      text: 'Log in to your account.',
                      maxLines: 2,
                      fontStyle: FontStyle.italic,
                      fontSize: 14.0,
                      textColor: ColorAssets.textSecondary,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: context.width * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextFormField2(
                          controller: controller.email,
                          hint: 'Email',
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: ColorAssets.primary,
                          ),
                          hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField2(
                          controller: controller.password,
                          hint: 'Password',
                          hintTextColor: ColorAssets.primary.withOpacity(0.3),
                          prefixIcon: const Icon(
                            Icons.key,
                            color: ColorAssets.primary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const ForgetPasswordScreen(),
                                transition: Transition.rightToLeft);
                          },
                          child: const CustomTextWidget(
                            text: 'Forget Password?',
                            maxLines: 1,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            textColor: ColorAssets.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    showBackgroundColor: true,
                    buttonText: 'Login',
                    onTap: () {
                      if(_formKey1.currentState!.validate()){
                        controller.loginUser();

                      }
                      },
                  ),
                  SizedBox(height: context.height * 0.02),
                  const CustomTextWidget(
                    text: 'Or Login with',
                    fontWeight: FontWeight.w600,
                    textColor: Colors.black87,
                  ),
                  SizedBox(height: context.height * 0.02),
                   Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSocialIcon(
                          onTap: (){
                            controller.loginWithGoogle(); 


                          },
                            imagePath: 'assets/images/google-icon.png'),
                        CustomSocialIcon(
                            imagePath: 'assets/images/facebook-icon.png'),
                        CustomSocialIcon(
                            imagePath: 'assets/images/apple-icon.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => RegisterScreen(controller: controller),
                          transition: Transition.rightToLeft);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an Account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorAssets.textLightGrey,
                            fontSize: 12.0),
                        children: const [
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorAssets.textPrimary,
                                fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
