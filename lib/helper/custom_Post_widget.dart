import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/post_image_row.dart';

import 'package:get/get.dart';
import 'package:nbatrade/models/post_model.dart';
import 'package:nbatrade/view/user%20profile/user_profile.dart';

class CustomPostWidget extends StatefulWidget {
  final PostModel post;
  final int index;
  final PostController postController;

  const CustomPostWidget({
    super.key,
    required this.postController,
    required this.post,
    required this.index,
  });

  @override
  State<CustomPostWidget> createState() => _CustomPostWidgetState();
}

class _CustomPostWidgetState extends State<CustomPostWidget> {
  QuillController descriptionController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorAssets.white,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage(MyAssetHelper.profileScreenImage),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    // Get.to(CommunityScreen(publicChatroomModel: publicChatroomModel))
                  },
                  child: const CustomTextWidget(
                    text: "S/Channel",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(const UserProfileScreen());
                  },
                  child: CustomTextWidget(
                    text: "Posted by " + widget.post.postedBy,
                    textColor: ColorAssets.black,
                    fontSize: 9,
                  ),
                ),
                const SizedBox(width: 2),
                CustomTextWidget(
                  text: widget.post.time,
                  textColor: ColorAssets.black,
                  fontSize: 8,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    widget.postController.togglePostExpansion(widget.post);
                    setState(() {});
                  },
                  child: const CustomTextWidget(text: "Expanded"),
                ),
                InkWell(
                    onTap: () {
                      widget.postController.togglePostExpansion(widget.post);
                      setState(() {});
                    },
                    child: const Icon(Icons.arrow_drop_down)),
              ],
            ),
          ),
        ),
        widget.post.expended == false
            // Short View Post
            ? Container(
                height: context.height * 0.22,
                color: ColorAssets.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: PostImagesRow(
                        profilePictures: widget.post.playerModel,
                        post: widget.post,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              text: widget.post.postTitle.toString(),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
                            ),
                            CustomTextWidget(
                                maxLines: 5, text: widget.post.description),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            // Full View Post
            : Container(
                child: Column(
                  children: [
                    Container(
                      height: Get.height / 3,
                      child: PostImagesRow(
                        post: widget.post,
                        profilePictures: widget.post.playerModel,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTextWidget(
                            maxLines: 3,
                            text: widget.post.postTitle.toString(),
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          widget.post.mediaPosted.toString() == ""
                              ? Container(
                                  width: context.width * 0.7,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: FileImage(File(widget
                                            .post.mediaPosted
                                            .toString()))),
                                  ))
                              : const SizedBox(),
                          SizedBox(
                            height: context.height * 0.03,
                          ),
                          CustomTextWidget(
                            maxLines: 10,
                            text: widget.post.description,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        Obx(() => Container(
              padding: const EdgeInsets.all(6),
              color: const Color(0xFFF6F6F6),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.postController.changeHeart(widget.index);
                    },
                    child: Icon(
                      widget.postController.heartEffects[widget.index].value ==
                              true
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: widget.postController.heartEffects[widget.index]
                                  .value ==
                              false
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                  CustomTextWidget(text: widget.post.likeCount.toString()),
                  const SizedBox(width: 20),
                  const Icon(Icons.comment_bank_outlined),
                  InkWell(
                    onTap: () {
                      Get.to(CommentScreen(comments: widget.post.comments!));
                    },
                    child: CustomTextWidget(
                        text: widget.post.commentCount.toString()),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      widget.postController.changeFire(widget.index);
                    },
                    child: Icon(Icons.local_fire_department_outlined,
                        color: widget.postController.fireEffects[widget.index]
                                    .value ==
                                false
                            ? Colors.orange
                            : Colors.black),
                  ),
                  CustomTextWidget(text: widget.post.flamCount.toString()),
                  const SizedBox(width: 20),
                  const Icon(Icons.share),
                  CustomTextWidget(text: widget.post.shareCount.toString()),
                ],
              ),
            )),
        const SizedBox(height: 10),
      ],
    );
  }
}
