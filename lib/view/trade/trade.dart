import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nbatrade/controllers/api_controller.dart';
import 'package:nbatrade/controllers/trade_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/circular_profile_avatar.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_team_dropdown.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';
import 'package:nbatrade/models/player_model_api.dart';
import 'package:nbatrade/view/trade/widgets/TE_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/picks_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/roster_trade_player_card.dart';
import 'package:nbatrade/view/trade/widgets/staff_trade_player_card.dart';

import '../../helper/constants/custom_player_dropdown.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  APIController apiController = Get.put(APIController());
  TradeController tradeController = Get.put(TradeController());
  String? teamLogo;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => DefaultTabController(
          length: tradeController.teamsInTabBar.length,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                backgroundColor: Colors.transparent,
                expandedHeight: context.height * 0.17,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
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
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: context.height,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomTeamDropDown(
                            dropDownText: "Select a team",
                            width: Get.width,
                            // teamName: apiController.listTeam,
                            teamName: apiController.availableTeams.value,
                            onChanged: (value) {
                              apiController.selectTeam(tradeController, value);
                              // tradeController.setSelectedTeam1(value);
                              print("ontap");
                            },
                            value: tradeController.selectedTeam.value),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey
                            ),
                            color: ColorAssets.greyContainer,
                          ),
                          child: ButtonsTabBar(
                            height: 70,
                            onTap: (e){
                              // teamLogo = tradeController.selectedTeam.value!.wikipediaLogoUrl;
                              // setState(() {
                              //
                              // });
                            },
                            backgroundColor: Colors.blueAccent,
                            unselectedBackgroundColor:
                                ColorAssets.white,

                            //splashColor: Colors.red,

                            labelStyle: const TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                            tabs: tradeController.teamsInTabBar.map((team) {

                              return Tab(
                                child: Row(
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 50,
                                        // decoration: BoxDecoration(
                                        //   image: DecorationImage(
                                        //     image: NetworkImage(team.wikipediaLogoUrl ?? "https://images.ctfassets.net/h8q6lxmb5akt/5qXnOINbPrHKXWa42m6NOa/421ab176b501f5bdae71290a8002545c/nba-logo_2x.png"),fit: BoxFit.cover
                                        //   )
                                        // ),
                                      child: SvgPicture.network(team.wikipediaLogoUrl ?? ""),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomTextWidget(text: team.name ??
                                        "unknown",fontSize: 16,fontWeight: FontWeight.w600,), // Display the team name
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        tradeController.removeTeamFromTabBar(
                                            team); // Call removeTeamFromTabBar when the delete button is clicked
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Expanded(
                          child: TabBarView(
                            children: tradeController.teamsInTabBar
                                .map(
                                  (e) => ListView.builder(
                                    itemCount: e.players!.length,
                                    itemBuilder: (bContext, i) =>
                                    Container(
                                      height: Get.height * 0.13,
                                      decoration: BoxDecoration(
                                        color: ColorAssets.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all()
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: Get.height * 0.13,
                                            width: Get.width * 0.25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CustomTextWidget(text: "${e.players![i].firstName} ${e.players![i].lastName}", fontWeight: FontWeight.bold,fontSize: 20),
                                                Row(
                                                  children: [
                                                    CustomTextWidget(text: e.players![i].position.toString() ?? "",textColor: ColorAssets.darkerGrey,),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CustomTextWidget(text: e.players![i].height.toString() ?? "",textColor: ColorAssets.darkerGrey,),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CustomTextWidget(text: e.players![i].weight.toString() ?? "",textColor: ColorAssets.darkerGrey,),

                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    CustomTextWidget(text: e.players![i].salary.toString() ?? "",textColor: ColorAssets.darkerGrey,),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CustomTextWidget(text:"${ calculateAgeFromString(e.players![i].birthDate.toString()).toString()} y",textColor: ColorAssets.darkerGrey,),
                                                  ],
                                                ),


                                              ],
                                            ),
                                          ),
                                          VerticalDivider(
                                            color: Colors.red[900],
                                            thickness: 4,
                                          ),
                                          Container(
                                            height: Get.height* 0.1,
                                            width: Get.width * 0.2,
                                            // decoration: BoxDecoration(
                                            //     image: DecorationImage(
                                            //         image: NetworkImage(tradeController.selectedTeam.value?.wikipediaLogoUrl ?? "https://images.ctfassets.net/h8q6lxmb5akt/5qXnOINbPrHKXWa42m6NOa/421ab176b501f5bdae71290a8002545c/nba-logo_2x.png"),fit: BoxFit.cover
                                            //     )
                                            // ),
                                            child: Image.network(teamLogo ?? "https://images.ctfassets.net/h8q6lxmb5akt/5qXnOINbPrHKXWa42m6NOa/421ab176b501f5bdae71290a8002545c/nba-logo_2x.png"),
                                          ),
                                        ],
                                      ),
                                    )

                                  ),
                                )
                                .toList(),
                          ),
                          // child: TabBarView(
                          //   children: tradeController.tabBarTeams.map((team) {
                          //     // Fetch the player data for the team
                          //     apiController.getPlayerApi(team.key ?? "");
                          //     return Obx(() {
                          //       return FirstTabbarView(
                          //         teamName: team.name ?? "",
                          //         teamImage:  "",
                          //         players: apiController.listPlayer.value, // Pass the player data to the view
                          //       );
                          //     });
                          //   }).toList(),
                          // ),
                        ),
                      ],
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     Expanded(
                  //       child: DefaultTabController(
                  //         length: 3,
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Container(
                  //                     padding: const EdgeInsets.all(6.0),
                  //                     decoration: BoxDecoration(
                  //                       color: Colors.white,
                  //                       border: Border.all(
                  //                           color: ColorAssets.primary),
                  //                     ),
                  //                     child: const Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         CustomTextWidget(text: '2023 - 2024'),
                  //                         Icon(Icons.arrow_drop_down)
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   const Icon(
                  //                     Icons.settings,
                  //                     color: ColorAssets.primary,
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //
                  //             ButtonsTabBar(
                  //               height: 70,
                  //               backgroundColor: ColorAssets.primary,
                  //               unselectedBackgroundColor: Colors.grey[600],
                  //               unselectedLabelStyle:
                  //                   const TextStyle(color: Colors.white),
                  //               labelStyle: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontWeight: FontWeight.bold),
                  //               tabs: [
                  //                 buildTabbar(
                  //                     title: 'Cavliers',
                  //                     rank: '#1',
                  //                     team: 'Team 1',
                  //                     image: 'assets/images/trade-rank-1.png'),
                  //                 buildTabbar(
                  //                     title: 'Pacers',
                  //                     rank: '#2',
                  //                     team: 'Team 2',
                  //                     image: 'assets/images/trade-rank-2.png'),
                  //                 buildTabbar(
                  //                     title: 'Heat',
                  //                     rank: '#3',
                  //                     team: 'Team 3',
                  //                     image: 'assets/images/trade-rank-3.png'),
                  //               ],
                  //             ),
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: Container(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(8.0),
                  //                     color: ColorAssets.primaryBackground,
                  //                     border: Border.all(color: Colors.grey)),
                  //                 width: double.infinity,
                  //                 child: Row(
                  //                   children: [
                  //                     SizedBox(width: 5.0),
                  //                     Icon(
                  //                       Icons.add_circle_outline_outlined,
                  //                       color: ColorAssets.primary,
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //             const Expanded(
                  //               child: TabBarView(
                  //                 children: [
                  //                   FirstTabbarView(
                  //                       teamName: 'Cavliers',
                  //                       teamImage:
                  //                           'assets/images/trade-rank-1.png'),
                  //                   FirstTabbarView(
                  //                       teamName: 'Pacers',
                  //                       teamImage:
                  //                           'assets/images/trade-rank-2.png'),
                  //                   FirstTabbarView(
                  //                       teamName: 'Heat',
                  //                       teamImage:
                  //                           'assets/images/trade-rank-3.png'),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
  int calculateAgeFromString(String dobString) {
    // Extract date parts from the string
    List<String> dateTimeParts = dobString.split('T');
    List<String> dateParts = dateTimeParts[0].split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    // Date of birth
    DateTime dob = DateTime(year, month, day);
    // Current date
    DateTime now = DateTime.now();
    // Calculate age
    int age = now.year - dob.year;
    // Adjust age if the birthday hasn't occurred yet this year
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
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
