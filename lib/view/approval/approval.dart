import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/view/approval/tabs/approved.dart';
import 'package:nbatrade/view/approval/tabs/panding.dart';
import 'package:nbatrade/view/approval/tabs/rejected.dart';

class TradeApprovalScreen extends StatefulWidget {
  const TradeApprovalScreen({super.key});

  @override
  State<TradeApprovalScreen> createState() => _TradeApprovalScreenState();
}

class _TradeApprovalScreenState extends State<TradeApprovalScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: Get.height * 0.19,
              flexibleSpace: const FlexibleSpaceBar(
                background: AppbarApproval(),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          customTabbar(),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: Get.height,
                            // width: Get.width,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: const [
                                // Content for each tab
                                TabPanding(),
                                TabApproved(),
                                TabRejected(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget customTabbar() {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicator: const UnderlineTabIndicator(
        // Customize the indicator if needed
        borderSide: BorderSide(width: 0.0, color: Color.fromARGB(0, 199, 7, 7)),
      ),
      isScrollable: true,
      labelPadding: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(10),
      indicatorPadding: const EdgeInsets.all(0),
      tabAlignment: TabAlignment.center,
// Remove default padding
      tabs: [
        CustomAplTab(
          text: "Pandings",
          color: const Color(0xFFD9D9D9),
          index: 0,
          selected: _tabController.index == 0,
          onTap: () {
            _tabController.animateTo(0);
            setState(() {});
          },
          fontColr: const Color(0xFF1C1B1F),
        ),
        CustomAplTab(
          text: "Acceped",
          color: const Color(0xFF9AD16E),
          index: 1,
          selected: _tabController.index == 1,
          onTap: () {
            _tabController.animateTo(1);
            setState(() {});
          },
          fontColr: const Color(0xFFFFFFFF),
        ),
        CustomAplTab(
          text: "Rejected",
          index: 2,
          color: const Color(0xFFDA7777),
          selected: _tabController.index == 2,
          onTap: () {
            _tabController.animateTo(2);
            setState(() {});
          },
          fontColr: const Color(0xFFFFFFFF),
        ),
      ],
    );
  }
}

class AppbarApproval extends StatelessWidget {
  const AppbarApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar2(
        title: 'Trade Approval',
        prefixIcon: Icons.arrow_back_ios,
        prefixIconOnTap: () {
          Get.back();
        },
        sufixWidget: const CircleAvatar());
  }
}

//   app bar
class CustomAppBar2 extends StatelessWidget {
  final void Function()? prefixIconOnTap;
  final void Function()? sufixWidgetOnTap;
  final IconData? prefixIcon;
  final Widget? sufixWidget;
  final String title;

  const CustomAppBar2({
    Key? key,
    this.prefixIcon,
    required this.title,
    this.prefixIconOnTap,
    this.sufixWidget,
    this.sufixWidgetOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2, 
      decoration: const BoxDecoration(
        color: ColorAssets.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: prefixIconOnTap,
                  child: Icon(
                    prefixIcon,
                    color: ColorAssets.white,
                  ),
                ),
                const Spacer(),
                if (sufixWidget != null)
                  InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
                if (sufixWidget == null) const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            child: CustomTextWidget(
                text: title,
                textColor: ColorAssets.white,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}

//   CustomAplTab
class CustomAplTab extends StatelessWidget {
  final String text;
  final int index;
  final Color color;
  final Color fontColr;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomAplTab(
      {super.key,
      required this.text,
      required this.color,
      required this.fontColr,
      required this.index,
      required this.selected,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(color: fontColr)),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
