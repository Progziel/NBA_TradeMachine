import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorAssets.white,
      // appBar: PreferredSize(
      //     preferredSize:
      //         Size.fromHeight(Get.height * 0.28), // Adjust the preferred height
      //     child: ),
    );
  }
}
