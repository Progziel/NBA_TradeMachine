import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
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
        backgroundColor: ColorAssets.primaryBackground,
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
            DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: context.height * 0.07,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            )),
                        child: Center(
                          child: ButtonsTabBar(
                            physics: const NeverScrollableScrollPhysics(),
                            backgroundColor: const Color(0xffA8A8FF),
                            unselectedBackgroundColor: Colors.grey.shade300,
                            tabs: [
                              Tab(
                                child: SizedBox(
                                  width: context.width * 0.4,
                                  child: const CustomTextWidget(
                                    text: 'Public Chatrooms',
                                    fontSize: 16.0,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                              Tab(
                                child: SizedBox(
                                  width: context.width * 0.4,
                                  child: const CustomTextWidget(
                                    text: 'Inbox',
                                    fontSize: 16.0,
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w500,
                                    textColor: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // child: TabBar(
                      //   tabAlignment: TabAlignment.fill,
                      //   indicator: BoxDecoration(
                      //     color: ColorAssets.primary.withOpacity(0.2),
                      //   ),
                      //   labelStyle: const TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w500),
                      //   labelColor: ColorAssets.black,
                      //   unselectedLabelColor: Colors.black87,
                      //   unselectedLabelStyle: const TextStyle(
                      //       fontSize: 14, fontWeight: FontWeight.w300),
                      //   indicatorSize: TabBarIndicatorSize.tab,
                      //   tabs: const [
                      //     Tab(
                      //       text: 'Public Chatrooms',
                      //     ),
                      //     Tab(
                      //       text: 'Inbox',
                      //     ),
                      //   ],
                      //   indicatorColor: Colors.black54,
                      // ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const CustomTextWidget(
                          text: '+ Create Chatroom',
                          textColor: ColorAssets.primary,
                        )),
                    Container(
                      color: Colors.transparent,
                      height: context.height * 0.45,
                      child: const TabBarView(
                        children: [
                          PublicChatrooms(),
                          InboxView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
