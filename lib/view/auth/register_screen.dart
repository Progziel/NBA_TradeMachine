import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/helper/constants/custom_textfield2.dart';
import 'package:nbatrade/view/auth/login_screen.dart';
import 'package:nbatrade/view/auth/widgets/auth_header.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AuthHeader(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: CustomTextWidget(
                    text: 'Create your Account',
                    maxLines: 2,
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    textColor: ColorAssets.textSecondary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: context.width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField2(
                        hint: 'Name',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField2(
                        hint: 'Email',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: ColorAssets.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField2(
                        hint: 'Password',
                        hintTextColor: ColorAssets.primary.withOpacity(0.3),
                        prefixIcon: const Icon(
                          Icons.key,
                          color: ColorAssets.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                CustomButton(
                  showBackgroundColor: true,
                  buttonText: 'Register',
                  onTap: () {
                    Get.to(() => const LoginScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                SizedBox(height: context.height * 0.01),
                const CustomTextWidget(
                  text: 'Or Register with',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black87,
                ),
                SizedBox(height: context.height * 0.01),
                const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSocialIcon(
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
                    Get.to(() => const LoginScreen(),
                        transition: Transition.rightToLeft);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an Account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorAssets.textLightGrey,
                          fontSize: 12.0),
                      children: const [
                        TextSpan(
                          text: 'Login',
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
    );
  }
}
