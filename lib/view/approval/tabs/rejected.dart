import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class TabRejected extends StatelessWidget {
  const TabRejected({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    textColor: ColorAssets.error,
                    text: "Please Note"),
                Center(
                  child: CustomTextWidget(
                      fontSize: 12,
                      textColor: ColorAssets.error,
                      text:
                          "Your Trade Post was against our terms and conditions.Please review our terms & Conditions before make Trade"),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Container(
              height: 500,
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(169, 255, 237, 237),
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
