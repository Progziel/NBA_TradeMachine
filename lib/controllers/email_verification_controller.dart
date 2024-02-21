import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/Repository/AuthRepository/auth_repository.dart';
import 'package:nbatrade/Repository/UserRepository/user_repository.dart';
import 'package:nbatrade/controllers/auth_controller.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/models/user_registration_model.dart';
import 'package:nbatrade/view/auth/start_screen.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForRedirect();
  }



  Future<void> sendVerificationEmail() async{

    try{
      await  AuthRepository.instance.sendEmailVerification();


    }
    catch(e){
      ToastMessage.showToastMessage(e.toString());

    }

  }


  void  setTimerForRedirect(){
    _timer=Timer.periodic(Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser!.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        AuthRepository.instance.setInitialScreen(user);
      }

    });

  }


  void manuallyCheckEmailVerification(){
    FirebaseAuth.instance.currentUser!.reload();
    final user=FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
      AuthRepository.instance.setInitialScreen(user);

    }
  }

}