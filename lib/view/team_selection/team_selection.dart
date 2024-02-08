import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/team_selection/widgets/draftboard_tabbarview.dart';
import 'package:nbatrade/view/team_selection/widgets/team_tabbarview.dart';

class NBATeamSelection extends StatefulWidget {
  const NBATeamSelection({super.key});

  @override
  _NBATeamSelectionState createState() => _NBATeamSelectionState();
}

class _NBATeamSelectionState extends State<NBATeamSelection>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                    height: Get.height * 0.15,
                    decoration: const BoxDecoration(
                      color: ColorAssets.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: ColorAssets.grey,
                                ),
                              ),
                              const CircularProfilePictureAvatar()
                            ],
                          ),
                        ),
                        const CustomTextWidget(
                          text: 'NBA Team Selection',
                          textColor: ColorAssets.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                ),
                child: ButtonsTabBar(
                  backgroundColor: ColorAssets.primary,
                  unselectedBackgroundColor: Colors.grey[600],
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    buildTab(title: 'Teams', context: context),
                    buildTab(title: 'Your Draft Board', context: context),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Team(),
                    Draftboard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tab buildTab({required BuildContext context, required String title}) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.1),
        child: CustomTextWidget(
          text: title,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
