import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/custom_Post_widget.dart';
import 'package:nbatrade/helper/post_image_row.dart';

class TabPanding extends StatefulWidget {
  const TabPanding({super.key});

  @override
  State<TabPanding> createState() => _TabPandingState();
}

class _TabPandingState extends State<TabPanding> {
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find<PostController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CustomTextWidget(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    textColor: ColorAssets.primary,
                    text: "Trade Status is Pending until Admin Approve"),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 29),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(169, 237, 237, 255),
                    borderRadius: BorderRadius.circular(20)),
                child:             Obx(()
                => ListView.builder(
                  // reverse: true,
                  shrinkWrap: true,
                  itemCount: postController.trendingPosts.length,
                   physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    final post = postController.trendingPosts[index];
                          
                    return CustomPostWidget(postController: postController, post: post, index: index);
                  },
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
