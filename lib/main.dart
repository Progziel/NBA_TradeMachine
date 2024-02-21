import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/Repository/AuthRepository/auth_repository.dart';
import 'package:nbatrade/firebase_options.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/auth/mail_verification.dart';
import 'package:nbatrade/view/auth/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
    Get.put(AuthRepository());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NBA Trade',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorAssets.primary),
          useMaterial3: true,
        ),
        // home:MailVerificationScreen(),);
        home: Scaffold(
            body: Center(child: CircularProgressIndicator(),)));
  }
}
