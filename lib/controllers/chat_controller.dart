import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/models/chat_message_model.dart';
import 'package:nbatrade/models/chatlist_model.dart';
import 'package:nbatrade/models/public_chatroom_model.dart';

class ChatController extends GetxController {
  //CommunityControllers
  final RxList<PublicChatroomModel> communities =
      <PublicChatroomModel>[...communitiesList].obs;
  final RxList<ChatListModel> inboxMessages = <ChatListModel>[...inboxList].obs;

  //ChatControllers
  final RxList<ChatMessageModel> chatMessages = <ChatMessageModel>[].obs;
  final TextEditingController chatController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    ChatMessageModel newMessage = ChatMessageModel(
      message: "Hello! How are you?",
      isSender: true,
      senderImage: '',
      senderName: 'You',
      messageTime: DateTime.now(),
    );
    chatController.clear();
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    update();
    debugPrint('message sent');
  }
}