import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/controllers/user_profile.controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/custom_Post_widget.dart';

import '../../../helper/custom_text_dropdown.dart';
import '../../../helper/post_image_row.dart';

class UserProfileFeed extends StatefulWidget {
  const UserProfileFeed({Key? key}) : super(key: key);

  @override
  State<UserProfileFeed> createState() => _UserProfileFeedState();
}

class _UserProfileFeedState extends State<UserProfileFeed> {
  PostController postController = Get.put(PostController());

  bool filterPostByType = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (filterPostByType == true)
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postController.myFeedPosts.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final post = postController.myFeedPosts[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPostWidget(
                      postController: postController, post: post, index: index),
                );

                // return Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Column(
                //     children: [
                //       Container(
                //         color: ColorAssets.grey,
                //         child: Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Row(
                //             children: [
                //               CircleAvatar(
                //                 backgroundImage: AssetImage(
                //                     MyAssetHelper.profileScreenImage),
                //                 radius: 10,
                //               ),
                //               const SizedBox(
                //                 width: 6,
                //               ),
                //               const CustomTextWidget(
                //                 text: " s/Space",
                //                 fontWeight: FontWeight.bold,
                //               ),
                //               const SizedBox(
                //                 width: 5,
                //               ),
                //               const CustomTextWidget(
                //                 text: "Posted by u/james_r",
                //                 fontSize: 10,
                //                 textColor: ColorAssets.black,
                //               ),
                //               const SizedBox(
                //                 width: 2,
                //               ),
                //               const CustomTextWidget(
                //                 text: "3 Days Ago",
                //                 fontSize: 10,
                //                 textColor: ColorAssets.black,
                //               ),
                //               const Spacer(),
                //               InkWell(
                //                 onTap: () {
                //                   userProfileController
                //                       .togglePostExpansion(post);
                //                   setState(() {});
                //                 },
                //                 child: post.expended == false
                //                     ? CustomTextWidget(text: "Expanded")
                //                     : CustomTextWidget(text: "View Short"),
                //               ),
                //               const Icon(Icons.arrow_drop_down),
                //             ],
                //           ),
                //         ),
                //       ),
                //       post.expended == false
                //           ? Container(
                //               height: 100,
                //               // color: Colors.red,
                //               child: Row(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   // if (post.playerModel![index].profileImage !=
                //                   //     null)
                //                   PostImagesRow(
                //                     post: post,
                //                     profilePictures: post.playerModel,
                //                     // profilePictures: [
                //                     //   post.playerModel![index].profileImage!,
                //                     // ],

                //                     // [
                //                     //   "assets/images/player2.png",
                //                     //   "assets/images/player2.png"
                //                     // ]
                //                     // post.playerModelList[index].profileImage
                //                   ),
                //                   Expanded(
                //                     child: Padding(
                //                       padding: EdgeInsets.all(8.0),
                //                       child: CustomTextWidget(
                //                         text: post.description,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           : Container(
                //               height: Get.height / 3,
                //               // width: Get.width,
                //               // color: const Color(0xff08591b),
                //               child: Column(
                //                 children: [
                //                   Expanded(
                //                     flex: 2,
                //                     child: PostImagesRow(
                //                         post: post,
                //                         profilePictures: post.playerModel
                //                         //   post.playerModelList[index].profileImage
                //                         // [
                //                         //   "assets/images/player2.png",
                //                         //   "assets/images/player2.png"
                //                         // ]
                //                         ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: CustomTextWidget(
                //                       text: post.description,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //       Container(
                //         padding: const EdgeInsets.all(6),
                //         color: ColorAssets.grey,
                //         child: const Row(
                //           children: [
                //             Icon(Icons.favorite_border),
                //             CustomTextWidget(text: "10"),
                //             SizedBox(
                //               width: 20,
                //             ),
                //             Icon(Icons.comment_bank_outlined),
                //             CustomTextWidget(text: "10"),
                //             SizedBox(
                //               width: 20,
                //             ),
                //             Icon(Icons.local_fire_department_outlined),
                //             CustomTextWidget(text: "10"),
                //             SizedBox(
                //               width: 20,
                //             ),
                //             Icon(Icons.share),
                //             CustomTextWidget(text: "10"),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         height: 10,
                //       )
                //     ],
                //   ),
                // );
              },
            ),
          ),
      ],
    );
  }
}
