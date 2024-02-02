import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

import '../../../helper/custom_text_dropdown.dart';
import '../../../models/post_model.dart';

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
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(top: 8,bottom: 0),
            decoration: BoxDecoration(
                color: ColorAssets.lightGrey,
                borderRadius: BorderRadius.circular(4)),
            child:  Column(
              children: [

                ListView.builder(
                    shrinkWrap: true,
                    itemCount: postController.posts.length,
                    itemBuilder: (BuildContext context, index){
                      final post = postController.posts[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...[
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
                                  text: "Posted by ", textColor: ColorAssets.black),
                              const SizedBox(
                                width: 2,
                              ),
                              const CustomTextWidget(
                                  text: "3 Days Ago",
                                  textColor: ColorAssets.greyContainer),
                            ],
                            Spacer(),

                            InkWell(
                                onTap:(){
                                  post.expended = !post.expended!;
                                  setState(() {

                                  });
                                },
                                child: CustomTextWidget(text: "Expanded")),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      post.expended == false ?
                      Container(
                        height: 100,
                        color: Colors.red,
                        child: Row(
                          children: [
                            post.profilePictures != null ?
                            postImagesRow(post.profilePictures): SizedBox(),
                            Expanded(
                                child: postDescriptionRow()),

                          ],
                        ),
                      ) : SizedBox(),
                      Container(
                        padding: EdgeInsets.all(6),
                        color: ColorAssets.grey,
                        child: Row(
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
                      )
                    ],
                  );
                })


              ],
            ),
          ),
      ],
    );
  }
  Widget postImagesRow(List<String>? profilePictures){
    return  ListView.builder(
      itemCount: profilePictures?.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return  Container(
               width: Get.width / 6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      profilePictures![index]
                  ),fit: BoxFit.cover
                )
              ),
              );
        }

    );
  }
  Widget postDescriptionRow(){
    return CustomTextWidget(text: "ksdkkashdjashdjaskd"
        "asbdajkshdksahdkjas"
        "sdjabdjhsabdjhabjhagshdsjdgshjagda"
        "dsadashjdgjadwye87y8bhcba",);
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
