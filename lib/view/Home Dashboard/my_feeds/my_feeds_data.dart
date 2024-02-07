import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';

import '../../../helper/custom_text_dropdown.dart';
import '../../../helper/post_image_row.dart';

class MyFeeds extends StatefulWidget {
  const MyFeeds({Key? key}) : super(key: key);

  @override
  State<MyFeeds> createState() => _MyFeedsState();
}

class _MyFeedsState extends State<MyFeeds> with SingleTickerProviderStateMixin {
  PostController postController = Get.put(PostController());
  bool filterPostByType = true;

  // @override
  // void initState() {
  //   postController.tabController = TabController(length: 4, vsync: this);
  //   // TODO: implement initState
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   postController.tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: const Duration(seconds: 1),
          openBuilder: (context, _) => const CreatePostView(),
          closedElevation: 0,
          closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
              side: const BorderSide(color: ColorAssets.grey, width: 1)),
          closedColor: ColorAssets.primary,
          closedBuilder: (context, _) => createPostRow(),
        ),
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
                                PostImagesRow(
                                  profilePictures: post.playerModel,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CustomTextWidget(
                                      text: post.description,
                                    ),
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
                                      profilePictures: post.playerModel),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomTextWidget(
                                    text: post.description,
                                  ),
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
                    const SizedBox(
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
  // Widget CreatePostView(){
  //   return Column(
  //     children: [
  //      GetBuilder<PostController>(builder: (controller){
  //        return  Column(
  //          children: [
  //            customTabbar(),
  //            SizedBox(
  //              height: Get.height /8,
  //              child: TabBarView(
  //                controller: postController.tabController,
  //                children:  const [
  //
  //                  Trending(),
  //                  Trending(),
  //                  Trending(),
  //                  Trending(),
  //
  //                ],
  //              ),
  //            ),
  //          ],
  //        );
  //      })
  //     ],
  //   );
  // }
  // Widget customTabbar() {
  //   return TabBar(
  //     controller: postController.tabController,
  //     dividerColor: Colors.transparent,
  //     indicator: const UnderlineTabIndicator(
  //       borderSide: BorderSide(width: 0.0, color: Colors.transparent),
  //     ),
  //     isScrollable: true,
  //     labelPadding: const EdgeInsets.all(6),
  //     padding: const EdgeInsets.all(0),
  //     indicatorPadding: const EdgeInsets.all(0),
  //     tabAlignment: TabAlignment.center,
  //     tabs: [
  //       CustomTab(
  //         text: "My Feeds",
  //         index: 0,
  //         icon: Symbols.news,
  //         selected: postController.tabController.index == 0,
  //         onTap: () {
  //           postController.tabController.animateTo(0);
  //           setState(() {
  //
  //           });
  //         },
  //       ),
  //       CustomTab(
  //         text: "Trending",
  //         icon: Symbols.news,
  //         index: 1,
  //         selected: postController.tabController.index == 1,
  //         onTap: () {
  //           postController.tabController.animateTo(1);
  //           setState(() {
  //
  //           });
  //
  //         },
  //       ),
  //       CustomTab(
  //         text: "New",
  //         icon: Symbols.news,
  //         index: 2,
  //         selected: postController.tabController.index == 2,
  //         onTap: () {
  //           postController.tabController.animateTo(2);
  //           setState(() {
  //
  //           });
  //
  //         },
  //       ),
  //       CustomTab(
  //           text: "Top",
  //           icon: Symbols.news,
  //           index: 3,
  //           selected: postController.tabController.index == 3,
  //           onTap: () {
  //             postController.tabController.animateTo(3);
  //           }),
  //     ],
  //   );
  // }
}

class CreatePostView extends StatefulWidget {
  // final void Function()? onTap;
  // final IconData icons;
  // final String text;
  const CreatePostView(
      {Key? key /*,required this.text,this.onTap,required this.icons*/})
      : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {

  final _selectedIndex = 0.obs;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() => Row(
                children: [
                  createPostButton(
                      index: 0, icons: Icons.document_scanner_outlined, text: "Text"),
                  createPostButton(
                      index: 1, icons: Icons.settings, text: "Tool"),
                  createPostButton(
                      index: 2, icons: Icons.link, text: "Link"),
                  createPostButton(
                      index: 3, icons: Icons.perm_media_outlined, text: "Media"),
                  createPostButton(
                      index: 4, icons: Icons.poll_outlined, text: "Poll"),
                ],
              ),),

            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(hint: "Text"),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: CustomTextFormField(hint: "Description",maxLines: 10)),
            CustomButton(
              onTap: (){
                _selectedIndex.value++;
              },
              buttonText: "Next",
              showBackgroundColor: true,
            ),
          ],
        ),
      ),

    );
  }

  Widget createPostButton(
      {required int index,
        required IconData icons,
      required String text,}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _selectedIndex.value = index,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:_selectedIndex.value == index ? ColorAssets.primary : ColorAssets.greyContainer,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icons, color: ColorAssets.white),
              const SizedBox(
                width: 5,
              ),
              CustomTextWidget(text: text, textColor: ColorAssets.white),
            ],
          ),
        ),
      ),
    );
  }
}
