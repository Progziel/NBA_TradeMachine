import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nbatrade/Repository/AuthRepository/Exceptions/exceptions.dart';
import 'package:nbatrade/controllers/auth_controller.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';
import 'package:nbatrade/view/auth/login_screen.dart';
import 'package:nbatrade/view/auth/mail_verification.dart';
import 'package:nbatrade/view/auth/register_screen.dart';
import 'package:nbatrade/view/auth/start_screen.dart';


class AuthRepository extends GetxController{


  static AuthRepository  get instance=>Get.find();


  final _auth=FirebaseAuth.instance;
 late final  Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);

    // ever(firebaseUser, _setInitialScreen);
  }



  void setInitialScreen(User? user){

    user==null?Get.offAll(const StartScreen()):user.emailVerified?Get.offAll(const HomeDashboard()):Get.offAll(MailVerificationScreen());
}



  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    try{
      await   _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        AuthRepository.instance.setInitialScreen(AuthRepository.instance.firebaseUser.value );


        // firebaseUser.value!=null?Get.offAll(const HomeDashboard()):Get.to(const StartScreen());


      });


    } on FirebaseAuthException catch (e){
      final ex=SignUpWithEmailAndPasswordFailure(e.code);
      debugPrint("FIREBASE AUTH EXCEPTION"+ex.message);
      throw ex;

    }
    catch(_){
      final ex=SignUpWithEmailAndPasswordFailure();
      debugPrint("EXCEPTION"+ex.message);
      throw ex;


    }


  }
  Future<void> loginUserWithEmailAndPassword(String email, String password) async{
    try{
      await   _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        debugPrint(" SignIn Successfully");
        AuthRepository.instance.setInitialScreen(AuthRepository.instance.firebaseUser.value );

        // firebaseUser.value!=null?Get.offAll(const HomeDashboard()):Get.to(const StartScreen());

      });


    } on FirebaseAuthException catch (e){
      final ex=SignUpWithEmailAndPasswordFailure(e.code);
      debugPrint("FIREBASE AUTH EXCEPTION"+ex.message);
      throw ex;

    }
    catch(_){
      final ex=SignUpWithEmailAndPasswordFailure();
      debugPrint("EXCEPTION"+ex.message);
      throw ex;


    }


  }




  Future<void> logout () async {
    AuthRepository.instance.setInitialScreen(AuthRepository.instance.firebaseUser.value );

    await _auth.signOut();

  }



  // Send email verification
  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser!.sendEmailVerification();


    }on FirebaseAuthException catch(e){
      debugPrint(e.toString());
    }
    catch(e){
      debugPrint(e.toString());

    }

  }




  ///GOOGLE SIGN-IN
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      ///returns a GoogleSignInAccount object representing the signed-in user.
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      ///Once the user is signed in, this line retrieves authentication details (GoogleSignInAuthentication) associated with the signed-in user.
      final GoogleSignInAuthentication? googleAuth =
      await userAccount?.authentication;
      // Create a new credential
      ///Using the obtained authentication details, this line creates a credential using GoogleAuthProvider.credential. It requires an access token and an ID token, which are retrieved from googleAuth.
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential & store it in Firebase-Authentications
      /// It returns a UserCredential object upon successful authentication.
      return await FirebaseAuth.instance.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw 'Something went wrong. Please try again';
    }catch(e){
      debugPrint(e.toString());
    }

  }




}