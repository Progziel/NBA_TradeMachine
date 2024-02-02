import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/home_feed.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/player_profile_screen.dart';
import 'package:nbatrade/view/compare_players/compare_player.dart';

import 'helper/constants/profile_detail_widget.dart';

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
        home:  const ComparePlayerScreen());
  }
}


