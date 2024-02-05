



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_profile_appbar.dart';
import 'package:nbatrade/helper/constants/custom_tab_bar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/profile_detail_widget.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/my_feeds_data.dart';
import 'package:nbatrade/view/Home%20Dashboard/trending/trending_screen.dart';
import 'package:nbatrade/view/compare_players/compare_player.dart';
import '../../../helper/constants/colors.dart';
import '../../../helper/constants/custom_appbar.dart';
import '../approval/approval.dart';
import '../nba_contract/nba_contract.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> with SingleTickerProviderStateMixin {

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
      child:Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.4), // Adjust the preferred height
          child:   Container(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:  AssetImage(MyAssetHelper.profileScreenImage),
                  radius: 40.0,
                ),
                CustomTextWidget(text: "u/james_r",fontSize: 14,fontWeight: FontWeight.w500,),
                CustomTextWidget(text: "wanting jody Allen to Move Away from Sports",fontSize: 14,fontWeight: FontWeight.w500,),
                SizedBox(height: context.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: context.height*0.05,
                      width: context.width*0.2,



                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),

                          ],
                          color: ColorAssets.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(child: CustomTextWidget(text: "Follow",textColor: ColorAssets.primary,fontSize: 14,fontWeight: FontWeight.bold,)),
                    ),
                    CustomTextWidget(text: "167 Followers",fontWeight: FontWeight.bold,fontSize: 15,),
                    CustomTextWidget(text: "167 Followers",fontWeight: FontWeight.bold,fontSize: 15,),




                  ],
                ),
                CustomTabBar(tabController: _tabController,
                  tabText1: "POSTS",
                  tabText2: "FLAMS",
                  tabText3: "COMMENTS",
                  tabText4: "FEEDBBACK",
                  tabText5: 'LIKES',),

              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SvgPicture.asset(MyAssetHelper.userProfileAppBarBackground,fit: BoxFit.fill,),

              SizedBox(
                height: Get.height,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    MyFeeds(),
                    ProfileDetails(),
                    ProfileDetails(),
                    ProfileDetails(),
                    ProfileDetails(),

                  ],
                ),
              ),

            ],
          ),
        ),


      ),

    );
  }
}
