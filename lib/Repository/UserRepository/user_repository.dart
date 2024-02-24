import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/models/user_registration_model.dart';

class UserRepository extends GetxController{

  static UserRepository get instance=>Get.find();


  final _db=FirebaseFirestore.instance;

  final String userCollectionPath="Users";
  final docId=DateTime.now().millisecondsSinceEpoch.toString();


  Future<void> createUser(UserRegistrationModel user) async {

  await   _db.collection(userCollectionPath).doc(docId).set(user.toJson()).whenComplete(() =>
        ToastMessage.showToastMessage("Account created successfully"))
        .catchError((error,stackTrac){
          ToastMessage.showToastMessage("Something went wrong, Try again");
          debugPrint(error.toString());

    });


  }



}