
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/post_image_row.dart';

import 'package:get/get.dart';
import 'package:nbatrade/models/post_model.dart';
import 'package:nbatrade/view/chatrooms/community_screen.dart';

class CustomPostWidget extends StatefulWidget {
  final PostModel post;
  final int index;
  final PostController postController;

  const CustomPostWidget({
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
                  onTap: (){
                    // Get.to(CommunityScreen(publicChatroomModel: publicChatroomModel))

                  },
                  child: const CustomTextWidget(
                    text: "S/Channel",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: (){
                    // Get.to(U)

                  },
                  child: CustomTextWidget(
                    text: "Posted by " + widget.post.postedBy,
                    textColor: ColorAssets.black,
                    fontSize: 8,
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
                    setState(() {

                    });
                  },
                  child: const CustomTextWidget(text: "Expanded"),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        widget.post.expended == false
            ? Container(
          height: context.height * 0.22,
          color: ColorAssets.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8),
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
                      SizedBox(height: context.height*0.01,),

                      CustomTextWidget(
                        maxLines: 5,
                        text:widget.post.description
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
            : Container(
          child: Column(
            children: [
              //
              // Container(
              //   height: Get.height / 3,
              //   child: Expanded(
              //     child: PostImagesRow(
              //       post: widget.post,
              //       profilePictures: widget.post.playerModel,
              //     ),
              //   ),
              // ),

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
                    SizedBox(height: context.height*0.01,),
                    Container(
                      height: context.height*0.3,
                      width: context.width*0.7,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight
                              ,

                              image: FileImage(File(widget.post.mediaPosted.toString())
                              )
                          ),
                        )),
                    SizedBox(height: context.height*0.03,),

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
          color: Color(0xFFF6F6F6),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.postController.changeHeart(widget.index);
                },
                child: Icon(
                  widget.postController.heartEffects[widget.index].value == true
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: widget.postController.heartEffects[widget.index].value == false
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              CustomTextWidget(text: widget.post.likeCount.toString()),
              SizedBox(width: 20),
              Icon(Icons.comment_bank_outlined),
              InkWell(
                onTap: () {
                  Get.to(CommentScreen(comments: widget.post.comments!));
                },
                child: CustomTextWidget(text: widget.post.commentCount.toString()),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  widget.postController.changeFire(widget.index);
                },
                child: Icon(Icons.local_fire_department_outlined,
                    color: widget.postController.fireEffects[widget.index].value == false
                        ? Colors.orange
                        : Colors.black),
              ),
              CustomTextWidget(text: widget.post.flamCount.toString()),
              SizedBox(width: 20),
              Icon(Icons.share),
              CustomTextWidget(text: widget.post.shareCount.toString()),
            ],
          ),
        )),
        const SizedBox(height: 10),
      ],
    );
  }
}
