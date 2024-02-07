import 'package:nbatrade/models/chatlist_model.dart';

class ChatMessageModel {
  final String message;
  final bool isSender;
  final String senderImage;
  final String senderName;
  final DateTime messageTime;

  ChatMessageModel({
    required this.message,
    required this.isSender,
    required this.senderImage,
    required this.senderName,
    required this.messageTime,
  });
}

List<ChatListModel> chatList = [
  ChatListModel(
    senderName: 'New Contact 1',
    senderImage: 'https://example.com/image1.jpg',
    messageType: 'Text',
    timestamp: '1 hour ago',
    chatMessages: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'New Contact 2',
    senderImage: 'https://example.com/image2.jpg',
    messageType: 'Incoming call',
    timestamp: '2 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'New Contact 3',
    senderImage: 'https://example.com/image3.jpg',
    messageType: 'Outgoing call',
    timestamp: '3 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'New Contact 4',
    senderImage: 'https://example.com/image4.jpg',
    messageType: 'Text',
    timestamp: '4 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'New Contact 5',
    senderImage: 'https://example.com/image5.jpg',
    messageType: 'Incoming call',
    timestamp: '5 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
];
