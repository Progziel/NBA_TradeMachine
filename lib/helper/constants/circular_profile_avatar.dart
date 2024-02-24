import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/view/userprofile/user_profile.dart';

class CircularProfilePictureAvatar extends StatelessWidget {
  const CircularProfilePictureAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ProfileScreen()),
      child: CircleAvatar(
        backgroundImage: AssetImage(MyAssetHelper.user2),
      ),
    );
  }
}
