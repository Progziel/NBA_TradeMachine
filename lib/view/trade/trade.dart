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
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: ButtonsTabBar(
                    height: 70,
                    backgroundColor: ColorAssets.primary,
                    unselectedBackgroundColor: Colors.grey[600],
                    unselectedLabelStyle: const TextStyle(color: Colors.white),
                    labelStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
              const Expanded(
                child: TabBarView(
                  children: [
                    FirstTabbarView(),
                    FirstTabbarView(),
                    FirstTabbarView(),
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
  const FirstTabbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                      color: ColorAssets.primary,
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Column(
                    children: [
                      Image.asset('assets/images/trade-rank-1.png'),
                      const Divider(
                        color: Colors.grey,
                        indent: 40.0,
                        endIndent: 40.0,
                      ),
                      const CustomTextWidget(
                        text: '\$119.6M Roster \$121.1M Total',
                        textColor: Colors.white,
                      ),
                      const CustomTextWidget(
                        text: '\$119.6M Roster \$121.1M Total',
                        textColor: Colors.white,
                      )
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
    );
  }
}
