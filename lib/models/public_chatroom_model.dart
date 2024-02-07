import 'package:nbatrade/models/chat_message_model.dart';

class PublicChatroomModel {
  final String image;
  final String communityName;
  final String subtitle;
  final List<ChatMessageModel> chats;

  PublicChatroomModel({
    required this.communityName,
    required this.image,
    required this.subtitle,
    required this.chats,
  });
}

final List<PublicChatroomModel> communitiesList = [
  PublicChatroomModel(
    communityName: "Tech Enthusiasts Hub",
    image:
        "https://img.freepik.com/premium-photo/sports-ball-blue-background_262243-334.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Explore the latest in technology and connect with fellow tech enthusiasts.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Bookworms Paradise",
    image:
        "https://img.freepik.com/premium-photo/various-sport-equipments-generative-ai_220873-24614.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "A place for avid readers to discuss and discover new books, share recommendations, and indulge in literary discussions.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Fitness Fanatics Club",
    image:
        "https://img.freepik.com/free-photo/football-background-with-frame_23-2147832085.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Join the community of fitness enthusiasts to share workout routines, health tips, and motivate each other towards a healthier lifestyle.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Travel Wanderers Society",
    image:
        "https://img.freepik.com/free-photo/modern-sport-composition-with-gym-elements_23-2148000115.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Connect with fellow travel enthusiasts, share travel experiences, and get inspired for your next adventure.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Artistic Minds Collective",
    image:
        "https://img.freepik.com/free-photo/sport-composition-with-modern-elements_23-2147914163.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "A space for artists to showcase their work, discuss creative ideas, and collaborate with other passionate individuals in the world of art.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Tech Enthusiasts Hub",
    image:
        "https://img.freepik.com/premium-photo/sports-ball-blue-background_262243-334.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Explore the latest in technology and connect with fellow tech enthusiasts.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Bookworms Paradise",
    image:
        "https://img.freepik.com/premium-photo/various-sport-equipments-generative-ai_220873-24614.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "A place for avid readers to discuss and discover new books, share recommendations, and indulge in literary discussions.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Fitness Fanatics Club",
    image:
        "https://img.freepik.com/free-photo/football-background-with-frame_23-2147832085.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Join the community of fitness enthusiasts to share workout routines, health tips, and motivate each other towards a healthier lifestyle.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Travel Wanderers Society",
    image:
        "https://img.freepik.com/free-photo/modern-sport-composition-with-gym-elements_23-2148000115.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "Connect with fellow travel enthusiasts, share travel experiences, and get inspired for your next adventure.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
  PublicChatroomModel(
    communityName: "Artistic Minds Collective",
    image:
        "https://img.freepik.com/free-photo/sport-composition-with-modern-elements_23-2147914163.jpg?size=626&ext=jpg&uid=R133237588&ga=GA1.1.290330012.1706909482&semt=ais",
    subtitle:
        "A space for artists to showcase their work, discuss creative ideas, and collaborate with other passionate individuals in the world of art.",
    chats: [
      ChatMessageModel(
        message: "Hi there!",
        isSender: false,
        senderImage: '',
        senderName: 'James Anderson',
        messageTime: DateTime.now(),
      ),
      ChatMessageModel(
        message: "Hello! How are you?",
        isSender: true,
        senderImage: '',
        senderName: 'You',
        messageTime: DateTime.now(),
      ),
    ],
  ),
];
