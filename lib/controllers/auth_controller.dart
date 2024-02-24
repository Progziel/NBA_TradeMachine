import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nbatrade/Repository/AuthRepository/auth_repository.dart';
import 'package:nbatrade/Repository/UserRepository/user_repository.dart';
import 'package:nbatrade/controllers/email_verification_controller.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/models/user_registration_model.dart';
import 'package:nbatrade/view/auth/mail_verification.dart';

class AuthController extends GetxController{

  static AuthController get instance=>Get.find();
  UserRepository userRepositoryController=Get.put(UserRepository());





  Future<void> loginWithGoogle() async {
    try {
      //Start Loading
      //Check Internet Connections
      ///Google Authentications
      final userCredentials =
      await AuthRepository.instance.signInWithGoogle();
      ///Save User Record
         UserRegistrationModel user = UserRegistrationModel(
            name: userCredentials?.user?.displayName,
            email:  userCredentials?.user?.email,
            password: "");
      userRepositoryController.createUser(user);
      //Stop Loading
      //Redirect
      AuthRepository.instance.setInitialScreen(userCredentials?.user);
    } catch (e) {
      ToastMessage.showToastMessage(e.toString());

    }
  }



  final name=TextEditingController();
  final email=TextEditingController();
  final password=TextEditingController();







 Future< void> registerUser() async {

    UserRegistrationModel user = UserRegistrationModel(
      name: name.text.trim(),
      email: email.text.trim(),
      password: password.text.trim(),);

   await AuthRepository.instance.createUserWithEmailAndPassword(email.text.trim(), password.text.trim());
    await   userRepositoryController.createUser(user).then((value){
      userRepositoryController.onDelete();
    });

  }

  void loginUser(){
    AuthRepository.instance.loginUserWithEmailAndPassword(email.text.trim(), password.text.trim());

  }



}
