import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class TabApproved extends StatelessWidget {
  const TabApproved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const Center(
              child: CustomTextWidget(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  textColor: ColorAssets.primary,
                  text: "These Trades are Successfully Approved"),
            ),
            SizedBox(height: 10),
            Container(
              height: 500,
              width: Get.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(41, 155, 209, 110),
                  borderRadius: BorderRadius.circular(20)),
              child: const Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
