import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/Home%20Dashboard/home_dashboard.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/player_profile_screen.dart';
import 'package:nbatrade/view/compare_players/compare_player.dart';
import 'package:nbatrade/view/user%20profile/user_profile.dart';

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
        home:  const UserProfileScreen());
  }
}



