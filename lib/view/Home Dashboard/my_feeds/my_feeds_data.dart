import 'dart:io';
import 'dart:math';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/comment.dart';
import 'package:nbatrade/helper/custom_Post_widget.dart';
import 'package:nbatrade/helper/flutter_quil.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/view/team_selection/team_selection.dart';
import 'package:nbatrade/view/team_selection/widgets/team_tabbarview.dart';
import 'package:nbatrade/view/trade/trade.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nbatrade/controllers/post_controller.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_blue_button.dart';
import 'package:nbatrade/helper/constants/custom_button.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/models/post_model.dart';

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
          openBuilder: (context, _) => CreatePostView(
            postController: postController,
          ),
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
        //if (filterPostByType == true)
        Obx(
          () => Expanded(
            child: ListView.builder(
              // reverse: true,
              shrinkWrap: true,
              itemCount: postController.myFeedPosts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                final post = postController.myFeedPosts[index];

                return CustomPostWidget(
                  postController: postController,
                  post: post,
                  index: index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget createPostRow() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CreatePostDialog(postController: postController);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: ColorAssets.white,
            border: Border.all(
              color: ColorAssets.grey,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: context.height * 0.05,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/user2.jpg"))),
              ),
            ),
            SizedBox(
              width: 4,
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
            SizedBox(
              width: 4,
            ),
            Container(
              width: Get.width / 5,
              height: 35,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorAssets.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: const CustomTextWidget(
                    text: "Trade", textColor: ColorAssets.white),
              ),
            ),
          ],
        ),
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

class CreatePostDialog extends StatelessWidget {
  final PostController postController;

  const CreatePostDialog({Key? key, required this.postController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(16), // Add padding to the content
        decoration: ShapeDecoration(
          color: Color(0xFFEDEDFF),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(16), // Adjust the border radius as needed
          ),
        ),
        child: SingleChildScrollView(
          child: CreatePostView(postController: postController),
        ),
      ),
    );
  }
}

class CreatePostView extends StatefulWidget {
  final PostController postController;
  // final void Function()? onTap;
  // final IconData icons;
  // final String text;
  const CreatePostView({
    Key? key,
    required this.postController,
    /*,required this.text,this.onTap,required this.icons*/
  }) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final _selectedIndex = 0.obs;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  TextEditingController _questionController = TextEditingController();
  List<TextEditingController> _optionControllers = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  QuillController descriptionController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: context.height * .73,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: [
                      createPostButton(
                          index: 0, icons: Symbols.post_add, text: "Text"),
                      createPostButton(
                          index: 1, icons: Symbols.build, text: "Tool"),
                      createPostButton(
                          index: 2, icons: Symbols.attach_file, text: "Link"),
                      createPostButton(
                          index: 3,
                          icons: Icons.perm_media_outlined,
                          text: "Media"),
                      createPostButton(
                          index: 4, icons: Icons.poll_outlined, text: "Poll"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Visibility(
                  visible: _selectedIndex.value == 0,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hint: "Title ",
                        fillColor: Color(0xFFEDEDFF),
                        controller: widget.postController.postNameController,
                      ),
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      MyRichTextField(
                        controller: descriptionController,
                        height: context.height * 0.4,
                      ),
                      // CustomTextFormField(hint: "Description",maxLines: 10,
                      //   fillColor:Color(0xFFEDEDFF),
                      //   controller: widget.postController.postDescriptionController,),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _selectedIndex.value == 1,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: context.height * 0.3,
                        width: context.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: ColorAssets.primary,
                          ),
                          color: Color(0xFFEDEDFF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomBlueButton(
                              text: "TRADE MACHINE",
                              icon: Symbols.arrow_circle_left_rounded,
                              height: context.height * 0.07,
                              width: context.width,
                              onTap: () {
                                Get.to(TradeScreen());
                              },
                            ),
                            CustomBlueButton(
                              text: "DRAFT BIG BOARDER CREATOR",
                              icon: Symbols.draft,
                              onTap: () {
                                Get.to(NBATeamSelection());
                              },
                              height: context.height * 0.07,
                              width: context.width,
                              font: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _selectedIndex.value == 2,
                  child: Column(
                    children: [
                      const CustomTextFormField(
                          hint: "Title of Link",
                          maxLines: 2,
                          fillColor: Color(0xFFEDEDFF)),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      const CustomTextFormField(
                          hint: "Paste your Link here..",
                          maxLines: 3,
                          fillColor: Color(0xFFEDEDFF)),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _selectedIndex.value == 3,
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        hint: "Title",
                        fillColor: Color(0xFFEDEDFF),
                      ),
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                      Obx(
                        () => Container(
                          padding: EdgeInsets.all(10),
                          height: context.height * 0.3,
                          width: context.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Color(0xFF545454), width: 2),
                            color: Color(0xFFEDEDFF),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              widget.postController.pickFile();
                            },
                            child: widget.postController.imagePath.value != ""
                                ? Container(
                                    decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: FileImage(File(widget
                                            .postController.imagePath.value
                                            .toString()))),
                                  ))
                                // imageFileList!.length!=0? GridView.builder(
                                //     itemCount: imageFileList!.length,
                                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //         crossAxisCount: 3),
                                //     itemBuilder: (BuildContext context, int index) {
                                //       return Image.file(File(imageFileList![index].path), fit: BoxFit.cover,);
                                //     })
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextWidget(
                                        text: "Select Media to Post ",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Icon(
                                            Symbols.add,
                                            size: 90,
                                            color: ColorAssets.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: _selectedIndex.value == 4,
                  child: Column(
                    children: [
                      const CustomTextFormField(
                        hint: "Title ",
                        fillColor: Color(0xFFEDEDFF),
                      ),
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      CustomTextFormField(
                        hint: "Description",
                        maxLines: 5,
                        fillColor: Color(0xFFEDEDFF),
                      ),
                      SizedBox(
                        height: context.height * 0.04,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _optionControllers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Symbols.drag_indicator,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: CustomTextFormField(
                                    fillColor: Color(0xFFEDEDFF),
                                    controller: _optionControllers[index],
                                    hint: 'Option ${index + 1}',
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _optionControllers.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.close))
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 18,
                              color: ColorAssets.primary,
                            ),
                            // MyRichTextField(controller: controller,
                            //   height: context.height*0.4,),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: ColorAssets.primary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _optionControllers
                                      .add(TextEditingController());
                                });
                              },
                              child: Text("Add Option"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  if (_selectedIndex.value < 4) {
                    _selectedIndex.value++;
                    setState(() {});
                  } else {
                    final timeCurrent = DateTime.now();
                    PostModel postModel = PostModel(
                        flamCount: Random().nextInt(100),
                        commentCount: Random().nextInt(50),
                        likeCount: Random().nextInt(70),
                        shareCount: Random().nextInt(60),
                        postTitle:
                            widget.postController.postNameController.text,
                        mediaPosted: widget.postController.imagePath.toString(),
                        playerModel: [
                          PlayerModel(
                            name: "Player 1",
                            profileImage: MyAssetHelper.nba1,

                            // profileImage: "https://media.wired.com/photos/5f75cdbbb5fbbbb0ed6d44b3/master/pass/Culture_NBAFinals_1228816794.jpg",
                          ),
                          PlayerModel(
                            name: "Player 2",
                            profileImage: MyAssetHelper.nba2,

                            // profileImage: "https://storage.googleapis.com/nbarankings-theringer-com-cms/public/media/ringerbasketballhub/players/DonovanMitchellM-small.png",
                          ),
                          PlayerModel(
                            name: "Player 3",
                            profileImage: MyAssetHelper.nba3,

                            // profileImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIbHtVscP83DXbGIPDyt4bkO_w0rNN_b3gA&usqp=CAU",
                          ),
                          PlayerModel(
                            name: "Player 4",
                            profileImage: MyAssetHelper.nba4,

                            // profileImage: "https://images.wsj.net/im-261194/square",
                          ),
                          // Add more players as needed
                        ],
                        description: """
Trade Breakdown
TOR: Kyle Lowry, Pat

Trade Breakdown
TOR: Kyle Lowry, Pat Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 MIL SRP,
MIL: This move is pretty risky...Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 TOR: Kyle Lowry, Pat Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 MIL SRP,
MIL: This move is pretty risky...Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 TOR: Kyle Lowry, Pat Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 MIL SRP,
MIL: This move is pretty risky...Connaughton, Nikola Jovic, AJ Green, 2024 POR SRP, 2027 MIL SRP, 2027 MIA FRP
MIA: Bruce Brown
MIL: Dennis Schroeder
MIL: This move is pretty risky...
""",
                        postedBy: "James_r",
                        time: timeago.format(timeCurrent).toString(),
                        channelName:
                            "S/Channel" + Random().nextInt(10).toString());
                    widget.postController.myFeedPosts.add(postModel);

                    setState(() {
                      Get.back();
                    });
                  }
                },
                buttonText: _selectedIndex.value > 3 ? "Post" : "Next",
                showBackgroundColor: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createPostButton({
    required int index,
    required IconData icons,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => _selectedIndex.value = index,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _selectedIndex.value == index
                ? ColorAssets.primary
                : Color(0xFF747474),
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
