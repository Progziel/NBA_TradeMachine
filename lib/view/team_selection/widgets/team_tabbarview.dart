import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/searchbar.dart';
import 'package:nbatrade/view/team_selection/widgets/all.dart';
import 'package:nbatrade/view/team_selection/widgets/c.dart';
import 'package:nbatrade/view/team_selection/widgets/pf.dart';
import 'package:nbatrade/view/team_selection/widgets/pg.dart';
import 'package:nbatrade/view/team_selection/widgets/sf.dart';
import 'package:nbatrade/view/team_selection/widgets/sg.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 6,
          child: Container(
            decoration: BoxDecoration(
                color: ColorAssets.primaryBackground,
                borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 219, 219, 255),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const TabBar(
                        padding: EdgeInsets.zero,
                        isScrollable: false,
                        dividerColor: Colors.transparent,
                        tabAlignment: TabAlignment.fill,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                        labelStyle: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: ColorAssets.primary),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: 'ALL'),
                          Tab(text: 'PG'),
                          Tab(text: 'SG'),
                          Tab(text: 'PF'),
                          Tab(text: 'SF'),
                          Tab(text: 'C'),
                        ],
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: ColorAssets.primary,
                      ),
                    ),
                  ),
                ),
                CustomSearchBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      AllView(),
                      PGView(),
                      SGView(),
                      PFView(),
                      SFView(),
                      CView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
