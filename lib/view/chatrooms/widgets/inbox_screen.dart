import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/chatlist_model.dart';
import 'package:nbatrade/models/public_chatroom_model.dart';

class InboxScreen extends StatelessWidget {
  final ChatListModel chatListModel;
  const InboxScreen({super.key, required this.chatListModel});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomTextWidget(
          text: chatListModel.senderName,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          textColor: Colors.white,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: ListView.builder(
        key: UniqueKey(),
        controller: controller.scrollController,
        itemCount: chatListModel.chatMessages.length,
        itemBuilder: (BuildContext context, int index) {
          final message = chatListModel.chatMessages[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: message.isSender
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (!message.isSender)
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30,
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0),
                        bottomLeft: message.isSender
                            ? const Radius.circular(16.0)
                            : Radius.zero,
                        bottomRight: message.isSender
                            ? Radius.zero
                            : const Radius.circular(16.0),
                      ),
                    ),
                    elevation: 5.0,
                    shadowColor: ColorAssets.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: message.isSender
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: message.senderName,
                                fontSize: 14,
                                textColor: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                text: message.message,
                                fontSize: 16,
                                textColor: Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CustomTextWidget(
                                text:
                                    '${message.messageTime.hour.toString()} : ${message.messageTime.minute.toString()}',
                                fontSize: 10,
                                textColor: Colors.black,
                              ),
                              SizedBox(width: 6.0),
                              Visibility(
                                visible: message.isSender,
                                child: Icon(
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
                if (message.isSender)
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 30,
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: TextFormField(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            controller: controller.chatController,
            maxLines: 1,
            onFieldSubmitted: (message) {
              controller.sendMessage();
            },
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
      ),
    );
  }
}
