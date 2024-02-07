import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/userprofile/user_profile.dart';

class CustomReusableAppBar extends StatelessWidget {
  final String text;
  final Widget topSection;
  const CustomReusableAppBar(
      {super.key, required this.text, required this.topSection});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                height: Get.height * 0.18,
                decoration: const BoxDecoration(
                  color: ColorAssets.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              color: ColorAssets.grey,
                            ),
                          ),
                          const CircularProfilePictureAvatar()
                        ],
                      ),
                    ),
                    CustomTextWidget(
                      text: text,
                      textColor: ColorAssets.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ],
          ),
          topSection,
        ],
      ),
    );
  }
}
