import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/widgets/auth_header.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                    text: 'Forget Password? No Worries!',
                    maxLines: 2,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    textColor: ColorAssets.textSecondary,
                  ),
                ),
                SizedBox(height: context.height * 0.03),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CustomTextWidget(
                    text:
                        'Please enter your registered email address, and we\'ll send you a link to reset your password.',
                    maxLines: 2,
                    fontSize: 12.0,
                   // fontStyle: FontStyle.italic,
                    textColor: ColorAssets.textSecondary,
                  ),
                ),
                SizedBox(height: context.height * 0.03),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CustomTextFormField(
                    hint: 'Email',
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: ColorAssets.primary,
                    ),
                  ),
                ),
                CustomButton(
                  showBackgroundColor: true,
                  buttonText: 'Reset',
                  onTap: () {},
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
