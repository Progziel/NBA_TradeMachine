<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'NBA Trade',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorAssets.primary),
          useMaterial3: true,
        ),
        home: HomeDashboard());
  }
}
=======
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/helper/constants/colors.dart';

import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';
import 'package:nbatrade/view/auth/login_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'NBA Trade',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorAssets.primary),
          useMaterial3: true,
        ),
        home:  const LoginScreen());

  }
}



>>>>>>> 46e25613a8a3bea8d62565a00637109deb821c8c
