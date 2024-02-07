import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/userprofile/widgets/reusable_profile_tabs.dart';

import '../../../helper/constants/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeader(),
              SizedBox(height: context.height * 0.01),
              CustomTextWidget(
                text: 'u/James',
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                textColor: ColorAssets.textLightGrey,
              ),
              SizedBox(height: context.height * 0.01),
              const CustomTextWidget(
                text: 'James Anderson',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: context.height * 0.01),
              CustomTextWidget(
                text: 'Wanting Jody Allen to Move Away from Sports',
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                textColor: ColorAssets.textLightGrey,
              ),
              SizedBox(height: context.height * 0.01),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextWidget(
                    text: '167 Followers',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: ColorAssets.textPrimary,
                  ),
                  CustomTextWidget(
                    text: '167 Following',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    textColor: ColorAssets.textPrimary,
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.02),
              const DividerContainer(text: 'General Settings'),
              SizedBox(height: context.height * 0.01),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Mode',
                suffixWidget: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Change Password',
                onTap: () {},
              ),
              SizedBox(height: context.height * 0.01),
              const DividerContainer(text: 'Information'),
              SizedBox(height: context.height * 0.01),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'About App',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Privacy Policy',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Privacy Policy',
                onTap: () {},
              ),
              ReUsableProfileTabs(
                icon: CupertinoIcons.lock,
                text: 'Share This App',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerContainer extends StatelessWidget {
  final String text;
  const DividerContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      width: double.infinity,
      color: Colors.grey.shade300,
      child: CustomTextWidget(
        text: text,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.25,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
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
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: ColorAssets.textLightGrey,
                        ),
                      ),
                      const CustomTextWidget(
                        text: 'Profile',
                        textColor: ColorAssets.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.edit,
                          color: ColorAssets.textLightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage: const NetworkImage(
                    'https://designimages.appypie.com/profilepicture/profilepicture-2-portrait-head.jpg'),
                radius: 60.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class HalfClipper extends CustomClipper<Rect> {
//   @override
//   Rect getClip(Size size) {
//     return Rect.fromLTRB(0.0, 0.0, size.width, size.height / 2);
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return false;
//   }
// }
