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
    senderName: 'Danny Ainge',
    senderImage:
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    messageType: 'Text',
    timestamp: '1 hour ago',
    chatMessages: [
      ChatMessageModel(
        message: "I'm considering some trade scenarios for the Celtics.",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hi there! Have you tried the NBA Trade Machine?",
        isSender: true,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'Masai Ujiri',
    senderImage:
        'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTl8fHVzZXJzfGVufDB8fDB8fHww',
    messageType: 'Incoming call',
    timestamp: '2 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "We need to shake things up with the Raptors roster.",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Sure, let's discuss potential trades over the phone.",
        isSender: true,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'Rob Pelinka',
    senderImage:
        'https://images.unsplash.com/photo-1563237023-b1e970526dcb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHVzZXJzfGVufDB8fDB8fHww',
    messageType: 'Text',
    timestamp: '3 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "LeBron wants some changes in the Lakers lineup.",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Let's strategize on potential trades to improve the team.",
        isSender: true,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  ChatListModel(
    senderName: 'Daryl Morey',
    senderImage:
        'https://plus.unsplash.com/premium_photo-1676998930980-fc6d4922c0b7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTd8fHVzZXJzfGVufDB8fDB8fHww',
    messageType: 'Text',
    timestamp: '4 hours ago',
    chatMessages: [
      ChatMessageModel(
        message: "Analyzing trade options for the 76ers.",
        isSender: false,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message:
            "Let's see if we can strengthen our roster with some smart moves.",
        isSender: true,
        senderImage: '',
        senderName: '',
        messageTime: DateTime.now(),
      ),
    ],
  ),
];
