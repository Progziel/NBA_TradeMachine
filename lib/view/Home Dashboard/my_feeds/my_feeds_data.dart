import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

import '../../../helper/custom_text_dropdown.dart';
import '../../../helper/post_image_row.dart';

class MyFeeds extends StatefulWidget {
  const MyFeeds({Key? key}) : super(key: key);

  @override
  State<MyFeeds> createState() => _MyFeedsState();
}

class _MyFeedsState extends State<MyFeeds> {
  PostController postController = Get.put(PostController());

  bool filterPostByType = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        createPostRow(),
        CustomTextDropdown(
          dropdown: filterPostByType,
          text: "Filter posts by type",
          onTap: () {
            filterPostByType = !filterPostByType;
            setState(() {});
          },
        ),
        if (filterPostByType == true)
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postController.myFeedPosts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final post = postController.myFeedPosts[index];

                return Column(
                  children: [

                    Container(
                      color: ColorAssets.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 10,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const CustomTextWidget(
                              text: "Channel 1",
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const CustomTextWidget(
                              text: "Posted by ",
                              textColor: ColorAssets.black,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const CustomTextWidget(
                              text: "3 Days Ago",
                              textColor: ColorAssets.greyContainer,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                postController.togglePostExpansion(post);
                                setState(() {});
                              },
                              child: const CustomTextWidget(text: "Expanded"),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    post.expended == false
                        ? Container(
                            height: 100,
                            color: Colors.red,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // if (post.playerModel![index].profileImage !=
                                //     null)
                                  PostImagesRow(
                                    profilePictures: post.playerModel,
                                   // profilePictures: [
                                   //   post.playerModel![index].profileImage!,
                                   // ],

                                      // [
                                      //   "assets/images/player2.png",
                                      //   "assets/images/player2.png"
                                      // ]
                                      // post.playerModelList[index].profileImage
                                      ),
                                Expanded(
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: CustomTextWidget(text:  post.description,),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: Get.height / 3,
                           // width: Get.width,
                            color: const Color(0xff08591b),
                            child: Column(
                              children: [

                                  Expanded(
                                    child: PostImagesRow(
                                      profilePictures: post.playerModel
                                        //   post.playerModelList[index].profileImage
// [
//   "assets/images/player2.png",
//   "assets/images/player2.png"
// ]
                                        ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextWidget(text:  post.description,),
                                ),
                              ],
                            ),
                          ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      color: ColorAssets.grey,
                      child: const Row(
                        children: [
                          Icon(Icons.favorite_border),
                          CustomTextWidget(text: "10"),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.comment_bank_outlined),
                          CustomTextWidget(text: "10"),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.local_fire_department_outlined),
                          CustomTextWidget(text: "10"),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.share),
                          CustomTextWidget(text: "10"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          ),
      ],
    );


  }






  Widget createPostRow() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: ColorAssets.white,
          border: Border.all(
            color: ColorAssets.grey,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 20,
          ),
          Container(
            width: Get.width / 1.8,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorAssets.grey,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: const CustomTextWidget(
              text: "Create post here",
              textColor: ColorAssets.grey,
            ),
          ),
          Container(
            width: Get.width / 5,
            height: 35,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ColorAssets.primary,
                borderRadius: BorderRadius.circular(8)),
            child: const CustomTextWidget(
                text: "Create Post", textColor: ColorAssets.white),
          ),
        ],
      ),
    );
  }
}

