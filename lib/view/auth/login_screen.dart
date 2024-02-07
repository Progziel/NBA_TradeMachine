import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';
import 'package:nbatrade/view/auth/forget_password.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/widgets/auth_header.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
                  child: CustomTextWidget(
                    text: 'Log in to your account.',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    textColor: ColorAssets.textSecondary,
                  ),
                ),
                SizedBox(height: context.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const CustomTextFormField(
                        hint: 'Email',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: ColorAssets.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const CustomTextFormField(
                        hint: 'Password',
                        prefixIcon: Icon(
                          Icons.key,
                          color: ColorAssets.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                    Get.offAll(() {
                      return const HomeDashboard();
                    });
                  },
                ),
                SizedBox(height: context.height * 0.02),
                const CustomTextWidget(
                  text: 'Or Login with',
                  fontWeight: FontWeight.w600,
                  textColor: Colors.black87,
                ),
                SizedBox(height: context.height * 0.02),
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
                    Get.to(() => const RegisterScreen(),
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
    );
  }
}
