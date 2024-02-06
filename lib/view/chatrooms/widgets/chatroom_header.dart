import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
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
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4, left: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Symbols.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 30,
                  )
                ],
              ),
            ),
            CustomTextWidget(
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
