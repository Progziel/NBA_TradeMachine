import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/chat_message_model.dart';
import 'package:nbatrade/models/chatlist_model.dart';
import 'package:nbatrade/view/chatrooms/chat_screen.dart';
import 'package:nbatrade/view/chatrooms/community_screen.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    return Container(
        color: Colors.transparent,
        child: Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.inboxMessages.length,
                itemBuilder: (context, index) {
                  final inboxMessage = controller.inboxMessages[index];
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(inboxMessage.senderImage),
                          radius: 40,
                        ),
                        title: CustomTextWidget(
                          text: inboxMessage.senderName,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        ),
                        subtitle: CustomTextWidget(
                          text: inboxMessage.messageType,
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
