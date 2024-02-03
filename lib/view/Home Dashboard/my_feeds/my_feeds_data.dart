import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

import '../../../helper/custom_text_dropdown.dart';

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
              itemCount: postController.posts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final post = postController.posts[index];

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
                                if (post.playerModel![index].profileImage !=
                                    null)
                                  Expanded(
                                    child: postImagesRow(
                                        [
                                          post.playerModel![index].profileImage!,
                                        ]

                                        // [
                                        //   "assets/images/player2.png",
                                        //   "assets/images/player2.png"
                                        // ]
                                        // post.playerModelList[index].profileImage
                                        ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: postDescriptionRow(),
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
                                if (post.playerModel![index].profileImage !=
                                    null)
                                  Expanded(
                                    child: postImagesRow(
                                        [post.playerModel![index].profileImage!]
                                        //   post.playerModelList[index].profileImage
// [
//   "assets/images/player2.png",
//   "assets/images/player2.png"
// ]
                                        ),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: postDescriptionRow(),
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

    //       Column(
    //   children: [
    //     createPostRow(),
    //     CustomTextDropdown(
    //       dropdown: filterPostByType,
    //       text: "Filter posts by type",
    //       onTap: () {
    //         filterPostByType = !filterPostByType;
    //         setState(() {});
    //       },
    //     ),
    //     if (filterPostByType == true)
    //       Container(
    //         width: Get.width,
    //        // height: Get.height,
    //         padding: const EdgeInsets.only(top: 8,bottom: 0),
    //         decoration: BoxDecoration(
    //             color: ColorAssets.lightGrey,
    //             borderRadius: BorderRadius.circular(4)),
    //         child:  ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: postController.posts.length,
    //             physics: NeverScrollableScrollPhysics(),
    //             itemBuilder: (BuildContext context, index){
    //               final post = postController.posts[index];
    //               return Column(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(4.0),
    //                     child: Row(
    //                       //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         ...[
    //                           const CircleAvatar(
    //                             radius: 10,
    //                           ),
    //                           const SizedBox(
    //                             width: 10,
    //                           ),
    //                           const CustomTextWidget(
    //                             text: "Channel 1",
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                           const SizedBox(
    //                             width: 5,
    //                           ),
    //                           const CustomTextWidget(
    //                               text: "Posted by ", textColor: ColorAssets.black),
    //                           const SizedBox(
    //                             width: 2,
    //                           ),
    //                           const CustomTextWidget(
    //                               text: "3 Days Ago",
    //                               textColor: ColorAssets.greyContainer),
    //                         ],
    //                         Spacer(),
    //
    //                         InkWell(
    //                             onTap:(){
    //                               postController.togglePostExpansion(post);
    //                               setState(() {
    //
    //                               });
    //
    //                             },
    //                             child: CustomTextWidget(text: "Expanded")),
    //                         Icon(Icons.arrow_drop_down),
    //                       ],
    //                     ),
    //                   ),
    //                   post.expended == false ?
    //                   Container(
    //                     height: 100,
    //                     color: Colors.red,
    //                     child: Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         post.profilePictures != null ?
    //                         postImagesRow(post.profilePictures): SizedBox(),
    //
    //                         Expanded(
    //                             child: Padding(
    //                               padding: const EdgeInsets.all(8.0),
    //                               child: postDescriptionRow(),
    //                             )),
    //
    //                       ],
    //                     ),
    //                   ) :   Container(
    //                     height:  Get.height / 3,
    //                     color: Color(0xff08591b),
    //                     child: Column(
    //                       children: [
    //                         post.profilePictures != null ?
    //                         Expanded(child: postImagesRow(post.profilePictures)): SizedBox(),
    //                         Padding(
    //                           padding: const EdgeInsets.all(8.0),
    //                           child: postDescriptionRow(),
    //                         ),
    //
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     padding: EdgeInsets.all(6),
    //                     color: ColorAssets.grey,
    //                     child: Row(
    //                       children: [
    //                         Icon(Icons.favorite_border),
    //                         CustomTextWidget(text: "10"),
    //                         SizedBox(
    //                           width: 20,
    //                         ),
    //                         Icon(Icons.comment_bank_outlined),
    //                         CustomTextWidget(text: "10"),
    //                         SizedBox(
    //                           width: 20,
    //                         ),
    //                         Icon(Icons.local_fire_department_outlined),
    //                         CustomTextWidget(text: "10"),
    //                         SizedBox(
    //                           width: 20,
    //                         ),
    //                         Icon(Icons.share),
    //                         CustomTextWidget(text: "10"),
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               );
    //             }),
    //       ),
    //   ],
    // )
  }

  // Widget postImagesRow(String? profilePictures){
  //   return  ListView.builder(
  //     itemCount: profilePictures?.length,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         return  Container(
  //              width: Get.width / 6,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: NetworkImage(
  //                     profilePictures![index]
  //                 ),fit: BoxFit.cover
  //               )
  //             ),
  //             );
  //       }
  //
  //   );
  // }
  Widget postImagesRow(List<String>? profilePictures) {
    return profilePictures != null
        ? ListView.builder(
            itemCount: profilePictures.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              print(profilePictures);
              return Container(
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(profilePictures[index]),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.yellow
                ),
              );
            },
          )
        : const SizedBox(); // Return an empty container if the list is null.
  }

  Widget postDescriptionRow() {
    return const CustomTextWidget(
      text: "ksdkkashdjashdjaskd"
          "asbdajkshdksahdkjas"
          "sdjabdjhsabdjhabjhagshdsjdgshjagda"
          "dsadashjdgjadwye87y8bhcba",
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
