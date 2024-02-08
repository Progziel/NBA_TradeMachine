import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/custom_Post_widget.dart';

import '../../../helper/constants/colors.dart';
import '../../../helper/constants/custom_text.dart';
import '../../../helper/custom_text_dropdown.dart';
import '../../../helper/post_image_row.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
   bool trendingPostByType = true;
  PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextDropdown(
          dropdown: trendingPostByType,
          text: "Filter posts by type",
          onTap: () {
            trendingPostByType = !trendingPostByType;
            setState(() {});
          },
        ),
        if (trendingPostByType == true)
          Obx(()
          => Expanded(
            child: ListView.builder(
              // reverse: true,
              shrinkWrap: true,
              itemCount: postController.trendingPosts.length,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final post = postController.trendingPosts[index];

                return CustomPostWidget(postController: postController, post: post, index: index);
              },
            ),
          ),
          ),
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: postController.trendingPosts.length,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (BuildContext context, index) {
//                 final post = postController.trendingPosts[index];
//
//                 return Column(
//                   children: [
//
//                     Container(
//                       color: ColorAssets.grey,
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Row(
//                           children: [
//                             const CircleAvatar(
//                               radius: 10,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const CustomTextWidget(
//                               text: "Channel 1",
//                               fontWeight: FontWeight.w500,
//                             ),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             const CustomTextWidget(
//                               text: "Posted by ",
//                               textColor: ColorAssets.black,
//                             ),
//                             const SizedBox(
//                               width: 2,
//                             ),
//                             const CustomTextWidget(
//                               text: "3 Days Ago",
//                               textColor: ColorAssets.greyContainer,
//                             ),
//                             const Spacer(),
//                             InkWell(
//                               onTap: () {
//                                 postController.togglePostExpansion(post);
//                                 setState(() {});
//                               },
//                               child: const CustomTextWidget(text: "Expanded"),
//                             ),
//                             const Icon(Icons.arrow_drop_down),
//                           ],
//                         ),
//                       ),
//                     ),
//                     post.expended == false
//                         ? Container(
//                       height: 100,
//                       color: Colors.red,
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (post.playerModel![index].profileImage !=
//                               null)
//                             PostImagesRow(
//                               profilePictures:post.playerModel, post: post,
//
//                               // [
//                               //   "assets/images/player2.png",
//                               //   "assets/images/player2.png"
//                               // ]
//                               // post.playerModelList[index].profileImage
//                             ),
//                           Padding(
//                             padding:  EdgeInsets.all(8.0),
//                             child: CustomTextWidget(text:  post.description,),
//                           ),
//                         ],
//                       ),
//                     )
//                         : Container(
//                       height: Get.height / 3,
//                       // width: Get.width,
//                       color: const Color(0xff08591b),
//                       child: Column(
//                         children: [
//                           if (post.playerModel![index].profileImage !=
//                               null)
//                             Expanded(
//                               child: PostImagesRow(
//                                 post: post,
//                                 profilePictures: post.playerModel
//                                 //   post.playerModelList[index].profileImage
// // [
// //   "assets/images/player2.png",
// //   "assets/images/player2.png"
// // ]
//                               ),
//                             ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CustomTextWidget(text:  post.description,),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(6),
//                       color: ColorAssets.grey,
//                       child: const Row(
//                         children: [
//                           Icon(Icons.favorite_border),
//                           CustomTextWidget(text: "10"),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Icon(Icons.comment_bank_outlined),
//                           CustomTextWidget(text: "10"),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Icon(Icons.local_fire_department_outlined),
//                           CustomTextWidget(text: "10"),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Icon(Icons.share),
//                           CustomTextWidget(text: "10"),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     )
//                   ],
//                 );
//               },
//             ),
//           ),
      ],
    );
  }
}
