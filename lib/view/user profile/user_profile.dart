import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_tab_bar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:get/utils.dart';
import 'package:nbatrade/helper/constants/userProfileFeed.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFFEDEDFF),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: Get.height / 2.3,
                flexibleSpace: FlexibleSpaceBar(
                  background: PreferredSize(
                    preferredSize: Size.fromHeight(
                        Get.height * 0.53), // Adjust the preferred height
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  backgroundImage: AssetImage(
                                      MyAssetHelper.profileScreenImage),
                                  radius: 40.0,
                                ),
                                SizedBox(
                                  height: context.height * 0.02,
                                ),
                                CustomTextWidget(
                                  text: "u/james_r",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                                CustomTextWidget(
                                  text: "JAMS",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomTextWidget(
                                  text:
                                      "wanting jody Allen to Move Away from Sports",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: context.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      height: context.height * 0.04,
                                      width: context.width * 0.2,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          color: ColorAssets.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: CustomTextWidget(
                                        text: "Follow",
                                        textColor: ColorAssets.primary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      )),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.01,
                                    ),
                                    CustomTextWidget(
                                      text: "167 Followers",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                    SizedBox(
                                      width: context.width * 0.02,
                                    ),
                                    CustomTextWidget(
                                      text: "167 Followers",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.height * 0.03,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: ColorAssets.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(40, 0, 0, 0),
                                        blurRadius:
                                            5.0, // Adjust blur radius as needed
                                        spreadRadius: 3,
                                        offset: Offset(0,
                                            6), // Offset shadow only on the bottom
                                      ),
                                    ],
                                  ),
                                  child: CustomTabBar(
                                    tabController: _tabController,
                                    tabText1: "POSTS",
                                    tabText2: "FLAMS",
                                    tabText3: "COMMENTS",
                                    tabText4: "FEEDBBACK",
                                    tabText5: 'LIKES',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height,
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            UserProfileFeed(),
                            UserProfileFeed(),
                            UserProfileFeed(),
                            UserProfileFeed(),
                            UserProfileFeed(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
