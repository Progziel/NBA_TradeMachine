import 'package:nbatrade/models/chat_message_model.dart';

class ChatListModel {
  final String senderName;
  final String senderImage;
  final String messageType;
  final String timestamp;
  final List<ChatMessageModel> chatMessages;

  ChatListModel({
    required this.senderName,
    required this.senderImage,
    required this.messageType,
    required this.timestamp,
    required this.chatMessages,
  });
}

final List<ChatListModel> inboxList = [
  ChatListModel(
    senderName: "Eva Rodriguez",
    senderImage: "eva_rodriguez_image_url",
    messageType: "text",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "Hello!",
        isSender: true,
        senderName: "Eva Rodriguez",
        senderImage: "eva_rodriguez_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: "David Lee",
    senderImage: "david_lee_image_url",
    messageType: "image",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "Take a look at this!",
        isSender: false,
        senderName: "David Lee",
        senderImage: "david_lee_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: "Sophie Turner",
    senderImage: "sophie_turner_image_url",
    messageType: "text",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "How are you doing?",
        isSender: false,
        senderName: "Sophie Turner",
        senderImage: "sophie_turner_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: "Michael Brown",
    senderImage: "michael_brown_image_url",
    messageType: "text",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "I'm excited about the weekend!",
        isSender: true,
        senderName: "Michael Brown",
        senderImage: "michael_brown_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: "Emily White",
    senderImage: "emily_white_image_url",
    messageType: "text",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "Let's catch up soon!",
        isSender: false,
        senderName: "Emily White",
        senderImage: "emily_white_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: "Daniel Smith",
    senderImage: "daniel_smith_image_url",
    messageType: "image",
    timestamp: DateTime.now().toIso8601String(),
    chatMessages: [
      ChatMessageModel(
        message: "Check out this amazing photo!",
        isSender: true,
        senderName: "Daniel Smith",
        senderImage: "daniel_smith_image_url",
        messageTime: DateTime.now(),
      ),
    ],
  ),
];
