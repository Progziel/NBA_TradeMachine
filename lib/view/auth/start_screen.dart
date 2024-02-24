import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/auth_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/auth/login_screen.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

import 'widgets/auth_header.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  AuthController controller = AuthController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AuthHeader(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.18, vertical: 8.0),
                child: CustomTextWidget(
                  text:
                      'Welcome to the ultimate destination for NBA trade enthusiasts!',
                  maxLines: 3,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  textColor: ColorAssets.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.height * 0.05),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
                child: CustomTextWidget(
                  text: 'Ready to start?',
                  maxLines: 2,
                  fontSize: 16.0,
                  textColor: ColorAssets.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: CustomTextWidget(
                  text:
                      'Log in or sign up to unlock the full potential of NBA Trade Machine.',
                  maxLines: 2,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  textColor: ColorAssets.textSecondary,
                ),
              ),
              SizedBox(height: context.height * 0.07),
              CustomButton(
                showBackgroundColor: true,
                buttonText: 'Login',
                onTap: () => Get.to(LoginScreen(controller: controller),
                    transition: Transition.rightToLeft),
              ),
              SizedBox(height: context.height * 0.02),
              CustomButton(
                showBackgroundColor: false,
                buttonText: 'Register',
                onTap: () => Get.to(RegisterScreen(controller: controller),
                    transition: Transition.rightToLeft),
              ),
              SizedBox(height: context.height * 0.05),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                        imagePath: 'assets/images/google-icon.png'),
                    CustomSocialIcon(
                        imagePath: 'assets/images/facebook-icon.png'),
                    CustomSocialIcon(imagePath: 'assets/images/apple-icon.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
