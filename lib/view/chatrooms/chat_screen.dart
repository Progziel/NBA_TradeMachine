import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/chat_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: context.height * 0.75,
                  color: Colors.white,
                  child: Obx(
                    () => ListView.builder(
                      key: UniqueKey(),
                      controller: controller.scrollController,
                      itemCount: controller.chatMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = controller.chatMessages[index];

                        return Align(
                          alignment: message.isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: message.isSender
                                    ? ColorAssets.primary
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: CustomTextWidget(
                                text: message.message,
                                fontSize: 14,
                                textColor: message.isSender
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextFormField(
                      style: TextStyle(
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
                        hintStyle: TextStyle(
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
                          onPressed: () {
                            controller.sendMessage();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
