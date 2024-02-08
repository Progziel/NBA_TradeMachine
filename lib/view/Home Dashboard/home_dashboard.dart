import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/Home%20Dashboard/trending/trending_screen.dart';
import 'package:nbatrade/view/approval/approval.dart';
import 'package:nbatrade/view/chatrooms/chatroom.dart';
import 'package:nbatrade/view/compare_players/compare_player.dart';
import 'package:nbatrade/view/news/news.dart';
import 'package:nbatrade/view/spaces/space%20view/space_view.dart';
import 'package:nbatrade/view/team_selection/team_selection.dart';
import 'package:nbatrade/view/trade/trade.dart';
import '../../../helper/constants/colors.dart';
import '../../../helper/constants/custom_appbar.dart';
import '../nba_contract/nba_contract.dart';
import 'my_feeds/home_tabs.dart';
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
  List<Map<String, dynamic>> gridItemsData = [
    {
      "text": "Team Selection",
      "icon": Icons.diversity_2,
      "ontap": () => Get.to(const NBATeamSelection())
    },
    {
      "text": "Trade",
      "icon": Icons.send_time_extension,
      "ontap": () => Get.to(const TradeScreen())
    },
    {
      "text": "NBA Contacts",
      "icon": Icons.diversity_3,
      "ontap": () => Get.to(const NbaContractScreen())
    },
    {
      "text": "Approval",
      "icon": Icons.approval_outlined,
      "ontap": () => Get.to(const TradeApprovalScreen())
    },
    {
      "text": "Compare Players",
      "icon": Icons.compare_arrows,
      "ontap": () => Get.to(const ComparePlayerScreen())
    },
    {
      "text": "News",
      "icon": Icons.auto_awesome_mosaic_sharp,
      "ontap": () => Get.to(const NewsScreen())
    },
    {
      "text": "Spaces",
      "icon": Icons.public,
      "ontap": () => Get.to(const SpaceScreen())
    },
    {
      "text": "Chatrooms",
      "icon": Icons.inbox,
      "ontap": () => Get.to(const ChatRoomScreen())
    },
  ];

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: Get.height * 0.30,
              flexibleSpace: FlexibleSpaceBar(
                background: appBar(),
              ),
            ),
            gridViewWidget(gridItemsData),
            // home scroll start-------------------------------------------------------
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  color: ColorAssets.primaryBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        customTabbar(),
                        const Divider(),
                        SizedBox(
                          height: Get.height,
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: const [
                              MyFeeds(),
                              Trending(),
                              Trending(),
                              Trending(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
      labelPadding: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(0),
      indicatorPadding: const EdgeInsets.all(0),
      tabAlignment: TabAlignment.center,
// Remove default padding
      tabs: [
        CustomTab(
          text: "My Feeds",
          index: 0,
          icon: Symbols.feed,
          selected: _tabController.index == 0,
          onTap: () {
            _tabController.animateTo(0);
            setState(() {});
          },
        ),
        CustomTab(
          text: "Trending",
          icon: Symbols.trending_up,
          index: 1,
          selected: _tabController.index == 1,
          onTap: () {
            _tabController.animateTo(1);
            setState(() {});
          },
        ),
        CustomTab(
          text: "New",
          icon: Symbols.autorenew,
          index: 2,
          selected: _tabController.index == 2,
          onTap: () {
            _tabController.animateTo(2);
            setState(() {});
          },
        ),
        CustomTab(
            text: "Top",
            icon: Symbols.subheader,
            index: 3,
            selected: _tabController.index == 3,
            onTap: () {
              _tabController.animateTo(3);
              setState(() {});
            }),
      ],
    );
  }

  Widget gridViewWidget(List<Map<String, dynamic>> gridItems) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20),
        child: SizedBox(
          height: Get.height / 3.3, // Set the desired height
          child: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 89,
                crossAxisCount: 4,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0, // Adjust this ratio as needed
              ),
              itemBuilder: (BuildContext context, int index) {
                return gridViewList(
                  text: gridItems[index]['text'],
                  icon: gridItems[index]['icon'],
                  onTap: gridItems[index]['ontap'],
                );
              },
              itemCount: gridItems.length,
            ),
          ),
        ),
      ),
    );
  }

  Widget gridViewList({text, onTap, icon}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
              radius: 25,
              backgroundColor: ColorAssets.buttonPrimary,
              child: Icon(
                icon,
                size: 30,
                color: ColorAssets.white,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextWidget(
          maxLines: 2,
          textColor: ColorAssets.primary,
          text: text,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget appBar() {
    return Stack(
      children: [
        const CustomAppBar(
            title: 'NBA Trade Machine',
            prefixIcon: Icons.menu,
            sufixWidget: CircularProfilePictureAvatar()),
        dropDownRow(),
      ],
    );
  }

  Widget dropDownRow() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorAssets.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(40, 0, 0, 0),
                    blurRadius: 5.0, // Adjust blur radius as needed
                    spreadRadius: 3,
                    offset: Offset(0, 6), // Offset shadow only on the bottom
                  ),
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    appBarRow(text: "SPACES", onTap: () {}),
                    const SizedBox(width: 7),
                    appBarRow(text: "TOOLS", onTap: () {}),
                    const SizedBox(width: 7),
                    appBarRow(text: "POST", onTap: () {}),
                    const SizedBox(width: 7),
                    appBarRow(text: "RESOURCES", onTap: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }

  Widget appBarRow({text, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFEDEDFF),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.only(left: 5, right: 0, top: 4, bottom: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
              text: text,
              fontSize: 10,
              textColor: const Color(0xFF1C1B1F),
              fontWeight: FontWeight.w500,
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Color(0xFF1C1B1F),
            ),
          ],
        ),
      ),
    );
  }
}
