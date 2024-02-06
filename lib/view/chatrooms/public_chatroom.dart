import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/chatrooms/community_screen.dart';

class PublicChatrooms extends StatelessWidget {
  const PublicChatrooms({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    return Container(
        color: Colors.transparent,
        child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.communities.length,
                itemBuilder: (context, index) {
                  final community = controller.communities[index];
                  return Column(
                    children: [
                      ListTile(
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
                    ],
                  );
                })));
  }
}
