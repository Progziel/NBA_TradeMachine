import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/view/chatrooms/inbox.dart';
import 'package:nbatrade/view/chatrooms/public_chatroom.dart';
import 'package:nbatrade/view/chatrooms/widgets/chatroom_header.dart';
import 'package:nbatrade/view/chatrooms/widgets/custom_story.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const ChatRoomHeader(),
            Card(
              elevation: 5.0,
              child: Container(
                height: 100,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CustomStoryWidget(
                        title: 'User${index + 1}',
                        imageUrl: index % 2 == 0
                            ? 'assets/images/user2.jpg'
                            : 'assets/images/user-profile.jpg');
                  },
                ),
              ),
            ),
            Spacer(),
            DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: context.height * 0.07,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: TabBar(
                      tabAlignment: TabAlignment.fill,
                      indicator: BoxDecoration(
                        color: ColorAssets.primary.withOpacity(0.2),
                      ),
                      labelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      labelColor: ColorAssets.black,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w300),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: const [
                        Tab(
                          text: 'Public Chatrooms',
                        ),
                        Tab(
                          text: 'Inbox',
                        ),
                      ],
                      indicatorColor: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.5,
                    child: const TabBarView(
                      children: [
                        PublicChatrooms(),
                        InboxView(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
