import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/firebase_options.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
    // Get.put(AuthRepository());
   // Get.put(APIController());
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
        home:HomeDashboard(),);
        // home: Scaffold(
        //     body: Center(child: CircularProgressIndicator(),)));
  }
}
