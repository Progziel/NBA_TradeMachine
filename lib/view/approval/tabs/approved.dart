import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/post_image_row.dart';

class TabApproved extends StatefulWidget {
  const TabApproved({super.key});

  @override
  State<TabApproved> createState() => _TabApprovedState();
}

class _TabApprovedState extends State<TabApproved> {
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
                    text: "These Trades are Successfully Approved"),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(41, 155, 209, 110),
                    borderRadius: BorderRadius.circular(20)),
                child:  Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 29),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(169, 237, 237, 255),
                      borderRadius: BorderRadius.circular(20)),
                  child:             Obx(()
                  => Expanded(
                    child: ListView.builder(
                      // reverse: true,
                      shrinkWrap: true,
                      itemCount: postController.trendingPosts.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, index) {
                        final post = postController.trendingPosts[index];
          
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const CustomTextWidget(
                                      text: "S/Channel",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CustomTextWidget(
                                      text: "Posted by "+post.postedBy,
                                      textColor: ColorAssets.black,
                                      fontSize: 8,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    CustomTextWidget(
                                      text: post.time,
                                      textColor: ColorAssets.black,
                                      fontSize: 8,
          
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
                              height: context.height*0.22,
                              color: ColorAssets.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PostImagesRow(
                                    profilePictures: post.playerModel, post: post,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomTextWidget(
                                        maxLines: 10,
          
                                        text: post.description,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : Container(
                              // width: Get.width,
                              // color: const Color(0xff08591b),
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height/3,
          
                                    child: Expanded(
                                      child: PostImagesRow(
                                        post: post,
                                        profilePictures: post.playerModel,
          
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
          
                                        CustomTextWidget(
                                            maxLines: 10,
                                            text:post.description
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Obx(()
                            => Container(
                              padding: const EdgeInsets.all(6),
                              color: Color(0xFFF6F6F6),
                              child:  Row(
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        postController.changeHeart(index);
                                      },
                                      child: Icon(postController.heartEffects[index].value==true?Icons.favorite_border:Icons.favorite,color:postController.heartEffects[index].value==false?Colors.red:Colors.black ,)),
          
                                  CustomTextWidget(text: post.likeCount.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.comment_bank_outlined),
                                  InkWell(
                                      onTap:(){
                                        Get.to(CommentScreen(comments: post.comments!,));
                                        // showModalBottomSheet(
                                        //   backgroundColor: Colors.transparent,
                                        //   context: context,
                                        //   builder: (BuildContext context) {
                                        //     return CommentScreen(
                                        //       post: post,
                                        //     );
                                        //   },
                                        // );
                                      },
                                      child: CustomTextWidget(text: post.commentCount.toString() )),
                                  SizedBox(
                                    width: 20,
                                  ),
          
                                  GestureDetector(
                                      onTap: (){
                                        postController.changeFire(index);
                                      },
                                      child: Icon(Icons.local_fire_department_outlined,color:postController.fireEffects[index].value==false?Colors.orange:Colors.black ,)),
          
                                  CustomTextWidget(text: post.flamCount.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.share),
                                  CustomTextWidget(text: post.shareCount.toString()),
                                ],
                              ),
                            ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  ),
          
                ),
          
              )
            ],
          ),
        ),
      ),
    );
  }
}
