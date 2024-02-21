import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/auth_controller.dart';
import 'package:nbatrade/controllers/email_verification_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/helper/constants/custom_textfield2.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/widgets/auth_header.dart';
import 'package:nbatrade/view/auth/widgets/custom_social_icon.dart';

class MailVerificationScreen extends StatelessWidget {

  const MailVerificationScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    VerifyEmailController verifyEmailController=Get.put(VerifyEmailController());
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
                  SizedBox(width: 5.0),
                  CustomTextWidget(
                    text: 'Verify Your email?',
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
                  'We have just send email verification link on your email.\n Please check email and click on that link to verify your Email address',
                  maxLines: 3,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.italic,
                  textColor: ColorAssets.textSecondary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.1,vertical: context.height*0.01),
                child: const CustomTextWidget(
                  text:
               "If not auto redirected after verification, click on the Continue button.",
                  maxLines: 3,
                  fontSize: 14.0,
                  textAlign: TextAlign.center,
                  fontStyle: FontStyle.italic,
                  textColor: ColorAssets.textSecondary,
                ),
              ),

              SizedBox(height: context.height * 0.05),
              CustomButton(
                showBackgroundColor: true,
                buttonText: 'Continue',
                onTap: () {
                  verifyEmailController.manuallyCheckEmailVerification();

                },
              ),
              SizedBox(height: context.height*0.02,),
              CustomButton(
                showBackgroundColor: true,
                buttonText: 'Resend mail',
                onTap: () {
                  verifyEmailController.sendVerificationEmail().then((value) {
                    ToastMessage.showToastMessage("Mail Sended Successfully");
                  });

                },
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
