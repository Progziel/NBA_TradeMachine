import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_appbar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/home_tabs.dart';
import 'package:nbatrade/view/approval/approval.dart';
import 'package:nbatrade/view/nba_contract/nba_contract.dart';
import 'package:nbatrade/view/news/news.dart';

import 'my_feeds/my_feeds_data.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool expanded = false;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAssets.white,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(Get.height * 0.28), // Adjust the preferred height
          child: appBar()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            gridViewWidget(),
            Container(
              color: ColorAssets.primaryBackground,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    customTabbar(),
                    const Divider(),
                    SizedBox(
                      height: Get.height,
                      // width: Get.width,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Content for each tab
                          MyFeeds(),
                          Container(child: const Text("Content for Tab 2")),
                          Container(child: const Text("Content for Tab 3")),
                          Container(child: const Text("Content for Tab 4")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTabbar() {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicator: const UnderlineTabIndicator(
        // Customize the indicator if needed
        borderSide: BorderSide(width: 0.0, color: Colors.transparent),
      ),
      isScrollable: true,
      labelPadding: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(0),
      indicatorPadding: const EdgeInsets.all(0),
      tabAlignment: TabAlignment.center,
// Remove default padding
      tabs: [
        CustomTab(
          text: "My Feeds",
          index: 0,
          icon: Symbols.news,
          selected: _tabController.index == 0,
          onTap: () {
            _tabController.animateTo(0);
            setState(() {});
          },
        ),
        CustomTab(
          text: "Trending",
          icon: Symbols.news,
          index: 1,
          selected: _tabController.index == 1,
          onTap: () {
            _tabController.animateTo(1);
            setState(() {});
          },
        ),
        CustomTab(
          text: "New",
          icon: Symbols.news,
          index: 2,
          selected: _tabController.index == 2,
          onTap: () {
            _tabController.animateTo(2);
            setState(() {});
          },
        ),
        CustomTab(
            text: "Top",
            icon: Symbols.news,
            index: 3,
            selected: _tabController.index == 3,
            onTap: () {
              _tabController.animateTo(3);
              setState(() {});
            }),
      ],
    );
  }

  Widget gridViewWidget() {
    return Container(
      // color: ColorAssets.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            gridViewList(text: "Team Selection", icon: Icons.diversity_2),
            gridViewList(text: "Trade", icon: Icons.send_time_extension),
            gridViewList(
                text: "NBA Contacts",
                icon: Icons.diversity_3,
                ontap: () {
                  Get.to(() => const NbaContractScreen());
                }),
            gridViewList(
                text: "Approval",
                icon: Icons.approval_outlined,
                ontap: () {
                  Get.to(() => TradeApprovalScreen());
                }),
            gridViewList(text: "Compare Players", icon: Icons.compare_arrows),
            gridViewList(
                text: "News",
                icon: Icons.auto_awesome_mosaic_sharp,
                ontap: () {
                  Get.to(() => const NewsScreen());
                }),
            gridViewList(text: "Spaces", icon: Icons.public),
            gridViewList(text: "Chatrooms", icon: Icons.inbox),
          ],
        ),
      ),
    );
  }

  Widget gridViewList({text, ontap, icon}) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: CircleAvatar(
              backgroundColor: ColorAssets.buttonPrimary,
              child: Icon(
                icon,
                color: ColorAssets.greyContainer,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextWidget(text: text),
      ],
    );
  }

  Widget appBar() {
    return Stack(
      children: [
        const CustomAppBar(
          title: 'NBA Trade Machine',
          prefixIcon: Icons.menu,
          sufixWidget: CircleAvatar(),
        ),
        dropDownRow(),
      ],
    );
  }

  Widget dropDownRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorAssets.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey
                    .withOpacity(0.4), // Adjust color and opacity as needed
                blurRadius: 5.0, // Adjust blur radius as needed
                offset: const Offset(0, 6), // Offset shadow only on the bottom
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              appBarRow(text: "SPACES", onTap: () {}),
              appBarRow(text: "TOOLS", onTap: () {}),
              appBarRow(text: "POST", onTap: () {}),
              appBarRow(text: "RESOURCES", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarRow({text, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: ColorAssets.greyContainer,
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(text: text),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
