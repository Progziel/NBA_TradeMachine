


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_reusable_tab.dart';
import 'package:nbatrade/view/Home%20Dashboard/my_feeds/home_tabs.dart';

class CustomTabBar extends StatefulWidget {
  final String tabText1;
  final String tabText2;
  final String tabText3;
  final String tabText4;
  final String tabText5;

  final TabController tabController;
  const CustomTabBar({super.key,
    required this.tabController,
    required this.tabText1,
    required this.tabText2,
    required this.tabText3,
    required this.tabText4,
    required this.tabText5});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return  TabBar(

      controller:widget.tabController,
      physics: NeverScrollableScrollPhysics(), // Disable scrolling physics

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
        CustomReusableTab(

          borderColor: ColorAssets.grey,

          text: widget.tabText1,
          index: 0,
          selected: widget.tabController.index == 0,
          onTap: () {
            widget.tabController.animateTo(0);
            setState(() {

            });
          }, isIcon: false,
        ),
        CustomReusableTab(

          borderColor: ColorAssets.grey,

          text: widget.tabText2,
          index: 1,
          selected: widget.tabController.index == 1,
          onTap: () {
            widget.tabController.animateTo(1);
            setState(() {

            });
          }, isIcon: false,
        ),
        CustomReusableTab(
          borderColor: ColorAssets.grey,


          text: widget.tabText3,
          index: 2,
          selected: widget.tabController.index == 2,
          onTap: () {
            widget.tabController.animateTo(2);
            setState(() {

            });
          }, isIcon: false,
        ),
        CustomReusableTab(
            isIcon: false,
          borderColor: ColorAssets.grey,
            text: widget.tabText4,
            index: 3,
            selected: widget.tabController.index == 3,
            onTap: () {
              widget.tabController.animateTo(3);
              setState(() {

              });
            }),
        CustomReusableTab(
            isIcon: false,
            borderColor: ColorAssets.grey,

            text: widget.tabText5,
            index: 4,
            selected: widget.tabController.index == 4,
            onTap: () {
              widget.tabController.animateTo(4);
              setState(() {

              });
            }),
      ],
    );
  }
}
