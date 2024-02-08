import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/helper/constants/custom_textfield2.dart';
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
          body: Column(
            children: [
              const AuthHeader(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(text: '🔒'),
                  SizedBox(width: 5.0),
                  CustomTextWidget(
                    text: 'Forgot Your Password?',
                    maxLines: 2,
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    textColor: ColorAssets.textSecondary,
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
                child: const CustomTextWidget(
                  text:
                      'Please enter your registered email address, and we\'ll send you a link to reset your password.',
                  maxLines: 3,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.italic,
                  textColor: ColorAssets.textSecondary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: context.width * 0.1),
                child: CustomTextFormField2(
                  hint: 'Email',
                  hintTextColor: ColorAssets.primary.withOpacity(0.3),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: ColorAssets.primary,
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.05),
              CustomButton(
                showBackgroundColor: true,
                buttonText: 'Reset',
                onTap: () {},
              ),
              const Spacer(),
              const CustomTextWidget(
                text:
                    'Need further assistance? \nContact [Support Email/Phone]. \nGet back into the NBA trade action! 🚀🏀',
                maxLines: 3,
                textAlign: TextAlign.center,
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                textColor: Colors.black54,
              ),
              SizedBox(height: context.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
