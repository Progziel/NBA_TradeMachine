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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 12.0),
                  height: Get.height * 0.18,
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
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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
                        text: 'Trade Machine',
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
              height: 60,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: TabBar(
                indicatorColor: ColorAssets.primary,
                padding: const EdgeInsets.all(7),
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: ColorAssets.primary,
                ),
                dividerColor: Colors.transparent,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                labelColor: ColorAssets.white,
                unselectedLabelColor: ColorAssets.primary,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                tabs: const [
                  Tab(
                    text: 'Teams',
                    height: 40,
                  ),
                  Tab(
                    text: 'Your Draft Board',
                    height: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Team(),
                  Draftboard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
