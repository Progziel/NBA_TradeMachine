import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/chatrooms/widgets/curved_edges_widget.dart';

class ChatRoomHeader extends StatelessWidget {
  const ChatRoomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCurvedWidget(
      child: Container(
        height: context.height * 0.2,
        color: ColorAssets.primary,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 12.0, right: 12.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Symbols.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const CircularProfilePictureAvatar()
                  ]),
            ),
            const CustomTextWidget(
              text: 'Chat Rooms',
              textColor: ColorAssets.textWhite,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
