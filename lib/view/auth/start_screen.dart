import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/auth/login_screen.dart';
import 'package:nbatrade/view/auth/register_screen.dart';

import 'widgets/auth_header.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AuthHeader(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
              child: CustomTextWidget(
                text:
                    'Welcome to the ultimate destination for NBA trade enthusiasts!',
                maxLines: 2,
                fontSize: 14.0,
                // fontStyle: FontStyle.italic,
                textColor: ColorAssets.textSecondary,
              ),
            ),
            SizedBox(height: context.height * 0.1),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
              child: CustomTextWidget(
                text: 'Ready to start?',
                maxLines: 2,
                fontSize: 14.0,
                textColor: ColorAssets.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
              child: CustomTextWidget(
                text:
                    'Log in or sign up to unlock the full potential of NBA Trade Machine.',
                maxLines: 2,
                fontSize: 14.0,
                textColor: ColorAssets.textSecondary,
              ),
            ),
            SizedBox(height: context.height * 0.1),
            CustomButton(
              showBackgroundColor: true,
              buttonText: 'Login',
              onTap: () => Get.to(const LoginScreen(),
                  transition: Transition.rightToLeft),
            ),
            SizedBox(height: context.height * 0.02),
            CustomButton(
              showBackgroundColor: false,
              buttonText: 'Register',
              onTap: () => Get.to(const RegisterScreen(),
                  transition: Transition.rightToLeft),
            )
          ],
        ),
      ),
    );
  }
}
