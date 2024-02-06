import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            Container(
              height: 60,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: TabBar(
                padding: const EdgeInsets.all(7),
                controller: _tabController,
                indicator: const BoxDecoration(
                  color: ColorAssets.primary,
                ),
                dividerColor: Colors.transparent,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                labelColor: ColorAssets.white,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
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
                children: [
                  const Team(),
                  const Draftboard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
