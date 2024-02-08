import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/chatrooms/community_screen.dart';

class PublicChatrooms extends StatelessWidget {
  const PublicChatrooms({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.communities.length,
        itemBuilder: (context, index) {
          final community = controller.communities[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              elevation: 5.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffCBCBFF),
                    borderRadius: BorderRadius.circular(12.0)),
                child: ListTile(
                  onTap: () => Get.to(
                    () => CommunityScreen(
                      publicChatroomModel: community,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(community.image),
                    radius: 40,
                  ),
                  title: CustomTextWidget(
                    text: community.communityName,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: CustomTextWidget(
                    text: community.subtitle,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
