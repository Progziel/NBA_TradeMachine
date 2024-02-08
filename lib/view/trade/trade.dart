import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/trade/widgets/TE_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/picks_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/roster_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/staff_trade_player_card.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: ColorAssets.primary),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(text: '2023 - 2024'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.settings,
                      color: ColorAssets.primary,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: ColorAssets.primaryBackground,
                      border: Border.all(color: Colors.grey)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: ButtonsTabBar(
                            height: 70,
                            backgroundColor: ColorAssets.primary,
                            unselectedBackgroundColor: Colors.grey[600],
                            unselectedLabelStyle:
                                const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            tabs: [
                              buildTabbar(
                                  title: 'Cavliers',
                                  rank: '#1',
                                  team: 'Team 1',
                                  image: 'assets/images/trade-rank-1.png'),
                              buildTabbar(
                                  title: 'Pacers',
                                  rank: '#2',
                                  team: 'Team 2',
                                  image: 'assets/images/trade-rank-2.png'),
                              buildTabbar(
                                  title: 'Heat',
                                  rank: '#3',
                                  team: 'Team 3',
                                  image: 'assets/images/trade-rank-3.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.add_circle_outline_outlined,
                        color: ColorAssets.primary,
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    FirstTabbarView(
                        teamName: 'Cavliers',
                        teamImage: 'assets/images/trade-rank-1.png'),
                    FirstTabbarView(
                        teamName: 'Pacers',
                        teamImage: 'assets/images/trade-rank-2.png'),
                    FirstTabbarView(
                        teamName: 'Heat',
                        teamImage: 'assets/images/trade-rank-3.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tab buildTabbar({
    required String rank,
    required String image,
    required String title,
    required String team,
  }) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image, height: 50),
          const SizedBox(width: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextWidget(
                text: rank,
                textColor: Colors.white,
              ),
              CustomTextWidget(
                text: title,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
              ),
              CustomTextWidget(
                text: team,
                fontSize: 12.0,
                textColor: Colors.white,
              ),
            ],
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }
}

class FirstTabbarView extends StatelessWidget {
  final String teamName;
  final String teamImage;
  const FirstTabbarView({
    super.key,
    required this.teamName,
    required this.teamImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: ColorAssets.primaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black12)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: const BoxDecoration(
                        color: ColorAssets.primary,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                spreadRadius: 2.0,
                                blurRadius: 10.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(teamImage),
                              CustomTextWidget(
                                text: teamName,
                                textColor: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          indent: 40.0,
                          endIndent: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading: '\$119.6M ', value: 'Roster'),
                            CustomRichText(
                                heading: '\$121.1M ', value: 'Total'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomRichText(
                                heading: '\$7.8M ', value: 'Over Tax'),
                            CustomRichText(
                                heading: '-\$26.9M ', value: 'Cap Space'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(color: Colors.black12),
                        ),
                        child: const TabBar(
                          padding: EdgeInsets.zero,
                          isScrollable: false,
                          dividerColor: Colors.transparent,
                          tabAlignment: TabAlignment.fill,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: [
                            Tab(text: 'Roster (8)'),
                            Tab(text: 'Picks'),
                            Tab(text: 'TE'),
                            Tab(text: 'Staff'),
                          ],
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: ColorAssets.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * 0.01),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const RosterTradePlayerCard();
                          },
                        ),
                        ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const PickTradePlayerCard();
                          },
                        ),
                        ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const TETradePlayerCard();
                          },
                        ),
                        ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const StaffTradePlayerCard();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  final String heading;
  final String value;
  const CustomRichText({
    super.key,
    required this.heading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: heading,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
