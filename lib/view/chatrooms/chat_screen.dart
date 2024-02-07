import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/chat_message_model.dart';
import 'package:nbatrade/models/chatlist_model.dart';

class ChatScreen extends StatelessWidget {
  final ChatListModel chatListModel;
  const ChatScreen({Key? key, required this.chatListModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Symbols.arrow_back_ios_rounded,
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: ColorAssets.primary.withOpacity(0.7),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(chatListModel.senderImage),
                radius: 20,
              ),
              const SizedBox(width: 10.0),
              CustomTextWidget(
                text: chatListModel.senderName,
                fontSize: 16.0,
                textColor: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              key: UniqueKey(),
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: chatListModel.chatMessages.length,
              itemBuilder: (BuildContext context, int index) {
                final chat = chatListModel.chatMessages[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: chat.isSender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!chat.isSender)
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user2.jpg'),
                          radius: 30,
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 2.0,
                          shadowColor: ColorAssets.primary,
                          child: Container(
                            width: context.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(16.0),
                                topRight: const Radius.circular(16.0),
                                bottomLeft: chat.isSender
                                    ? const Radius.circular(16.0)
                                    : Radius.zero,
                                bottomRight: chat.isSender
                                    ? Radius.zero
                                    : const Radius.circular(16.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: chat.isSender
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: chat.isSender
                                            ? 'You'
                                            : chatListModel.senderName,
                                        fontSize: 14,
                                        textColor: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      CustomTextWidget(
                                        text: chat.message,
                                        fontSize: 16,
                                        maxLines: 30,
                                        textColor: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            '${chat.messageTime.hour.toString()} : ${chat.messageTime.minute.toString()}',
                                        fontSize: 10,
                                        textColor: Colors.black,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Visibility(
                                        visible: chat.isSender,
                                        child: const Icon(
                                          Icons.done_all,
                                          color: ColorAssets.primary,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (chat.isSender)
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user-profile.jpg'),
                          radius: 30,
                        ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (message) {},
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54)),
                    border: InputBorder.none,
                    hintText: 'Message',
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.send,
                        size: 14,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
