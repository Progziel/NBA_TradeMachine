import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
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
    return ListView.builder(
        shrinkWrap: true,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
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
                    () => ChatScreen(chatListModel: chat),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(chat.senderImage),
                    radius: 40,
                  ),
                  title: CustomTextWidget(
                    text: chat.senderName,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  subtitle: CustomTextWidget(
                    text: chat.chatMessages[0].message,
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
