import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/controllers/profile_screen_controller.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_blue_button.dart';
import 'package:nbatrade/helper/constants/custom_reusable_appbar.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_toast.dart';

import '../../models/player_model.dart';

class ComparePlayerScreen extends StatelessWidget {
  const ComparePlayerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProfileScreenController profileScreenController =
        Get.put(ProfileScreenController());

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.5),
            child: CustomReusableAppBar(
              text: "Compare NBA Players",
              topSection: Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    children: [
                      TopSection(
                        colorList:
                            profileScreenController.selectedPlayer1.value !=
                                    null
                                ? <Color>[
                                    ColorAssets.buttonPrimary,
                                    ColorAssets.error
                                  ]
                                : [ColorAssets.black, ColorAssets.black],
                        imagePath:
                            profileScreenController.selectedPlayer1.value !=
                                    null
                                ? profileScreenController
                                    .selectedPlayer1.value!.profileImage!
                                : MyAssetHelper.placeholder,
                        type: profileScreenController.selectedPlayer1.value !=
                                null
                            ? profileScreenController
                                .selectedPlayer1.value!.type!
                            : "",
                        rank: profileScreenController.selectedPlayer1.value !=
                                null
                            ? "#" +
                                profileScreenController
                                    .selectedPlayer1.value!.rank!
                                    .toString()
                            : "",
                        profileScreenController: profileScreenController,
                        value: profileScreenController.selectedPlayer1.value,
                        players: profileScreenController.players,
                        onChanged: (value) {
                          profileScreenController.setSelectedPlayer1(value);
                        },
                      ),
                      TopSection(
                        colorList:
                            profileScreenController.selectedPlayer2.value !=
                                    null
                                ? <Color>[
                                    ColorAssets.buttonPrimary,
                                    ColorAssets.error
                                  ]
                                : [ColorAssets.black, ColorAssets.black],
                        imagePath:
                            profileScreenController.selectedPlayer2.value !=
                                    null
                                ? profileScreenController
                                    .selectedPlayer2.value!.profileImage!
                                : MyAssetHelper.placeholder,
                        type: profileScreenController.selectedPlayer2.value !=
                                null
                            ? profileScreenController
                                .selectedPlayer2.value!.type!
                            : "",
                        rank: profileScreenController.selectedPlayer2.value !=
                                null
                            ? "#" +
                                profileScreenController
                                    .selectedPlayer2.value!.rank!
                                    .toString()
                            : "",
                        profileScreenController: profileScreenController,
                        value: profileScreenController.selectedPlayer2.value,
                        players: profileScreenController.players,
                        onChanged: (value) {
                          profileScreenController.setSelectedPlayer2(value);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  profileScreenController.selectedPlayer1.value != null &&
                          profileScreenController.selectedPlayer2.value != null
                      ? CopyWidget()
                      : SizedBox(),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PlayerDetailSection(
                    heading: "Information",
                    fieldCounts: 7,
                    leftInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? profileScreenController
                              .selectedPlayer1.value!.debut!
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? profileScreenController
                              .selectedPlayer1.value!.college!
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? profileScreenController.selectedPlayer1.value!.age!
                              .toString()
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? profileScreenController
                              .selectedPlayer1.value!.height!
                              .toString()
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? profileScreenController
                              .selectedPlayer1.value!.weight!
                              .toString()
                          : "",
                    ],
                    rightInfo: [
                      profileScreenController.selectedPlayer2.value != null
                          ? profileScreenController
                              .selectedPlayer2.value!.debut!
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? profileScreenController
                              .selectedPlayer2.value!.college!
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? profileScreenController.selectedPlayer2.value!.age!
                              .toString()
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "0"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "0"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? profileScreenController
                              .selectedPlayer2.value!.height!
                              .toString()
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? profileScreenController
                              .selectedPlayer2.value!.weight!
                              .toString()
                          : "",
                    ],
                    centerInfo: [
                      "Debut",
                      "College",
                      "Age",
                      "Draft",
                      "Pick #",
                      "Height",
                      "Weight"
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PlayerDetailSection(
                    heading: "Contract",
                    fieldCounts: 7,
                    leftInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "\$15.0M"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "3"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "\$5.0M"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "2021"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "2024"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "Bird"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "Dan Tobin Jsason Glushon"
                          : "",
                    ],
                    rightInfo: [
                      profileScreenController.selectedPlayer2.value != null
                          ? "\$180.0M"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "5"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "\$36.0M"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "2019"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "2024"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "Early Bird"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "Torris Harris"
                          : "",
                    ],
                    centerInfo: [
                      "Amount",
                      "Years",
                      "Avg Salary",
                      "Start Year",
                      "FA Year",
                      "Signed w/ ",
                      "Agents"
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PlayerDetailSection(
                    heading: "Season Stats",
                    fieldCounts: 10,
                    leftInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "31"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "2.4"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.6"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.7"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "40.3%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "36.4%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "68.8%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "50.0%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "9.2"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.3"
                          : "",
                    ],
                    rightInfo: [
                      profileScreenController.selectedPlayer2.value != null
                          ? "43"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "17.7"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "6.0"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "3.1"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "50.8%"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "35.6%"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "90.1%"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "55.5%"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "16.9"
                          : "",
                      profileScreenController.selectedPlayer2.value != null
                          ? "4.2"
                          : "",
                    ],
                    centerInfo: [
                      "G",
                      "PTS/G",
                      "RB/G",
                      "AST/G",
                      "FG%",
                      "3P% ",
                      "FT%",
                      "eFG%",
                      "PER",
                      "W/S",
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PlayerDetailSection(
                    heading: "Career Stats",
                    fieldCounts: 6,
                    leftInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "324"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "6.9"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "2.0"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "1.2"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "40.6%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "35.4%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "76.1%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "51.2%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "11.2"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "7.5"
                          : "",
                    ],
                    rightInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "870"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "16.3"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "6.1"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "47.9"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "36.9%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "83.6%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "53.1%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "55.5%"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "16.7"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "68.4"
                          : "",
                    ],
                    centerInfo: [
                      "G",
                      "PTS/G",
                      "RB/G",
                      "AST/G",
                      "FG%",
                      "3P% ",
                      "FT%",
                      "eFG%",
                      "PER",
                      "W/S",
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  PlayerDetailSection(
                    heading: "LEBRON Stats",
                    fieldCounts: 6,
                    leftInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "Secondary Ball Handler"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "SG"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "-2.25"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "-0.91"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "-1.33"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.02"
                          : "",
                    ],
                    rightInfo: [
                      profileScreenController.selectedPlayer1.value != null
                          ? "Shot Creator"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "PF"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.57"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "-0.06"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "0.63"
                          : "",
                      profileScreenController.selectedPlayer1.value != null
                          ? "2.45"
                          : "",
                    ],
                    centerInfo: [
                      "off.Type",
                      "Pos",
                      "LEBRON",
                      "DLEBRON",
                      "OLEBRON",
                      "Ws Added",
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CopyWidget extends StatelessWidget {
  const CopyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          MyAssetHelper.twitter,
          height: 25,
        ),
        SizedBox(
          width: Get.width * 0.01,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(
                    ClipboardData(text: "HTTPS://NBa-trade-machine.com"))
                .then((_) {
              ToastMessage.showToastMessage("Copied to clipboard");
            });
          },
          child: Container(
            height: Get.height * 0.05,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1, // Border width
              ),
            ),
            child: Row(
              children: [
                CustomTextWidget(
                  text: "HTTPS://NBa-trade-machine.com",
                  textColor: ColorAssets.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
                Icon(
                  Symbols.copy_all,
                  color: ColorAssets.black,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: Get.width * 0.01,
        ),
        Icon(
          Symbols.share,
          color: ColorAssets.black,
        )
      ],
    );
  }
}

class PlayerDetailSection extends StatelessWidget {
  final int fieldCounts;
  final List<String> leftInfo;
  final List<String> rightInfo;
  final List<String> centerInfo;

  final String heading;
  const PlayerDetailSection(
      {super.key,
      required this.heading,
      required this.fieldCounts,
      required this.leftInfo,
      required this.rightInfo,
      required this.centerInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        width: Get.width,
        decoration: BoxDecoration(
            color: ColorAssets.primaryBackground,
            borderRadius: BorderRadius.circular(12.0)),
        child: Stack(
          children: [
            Column(
              children: [
                CustomBlueButton(text: heading),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: fieldCounts,
                  itemBuilder: (BuildContext context, int index) => ReusableRow(
                    leftInfo: leftInfo[index],
                    rightInfo: rightInfo[index],
                    centerInfo: centerInfo[index],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class ReusableRow extends StatelessWidget {
  final String leftInfo;
  final String rightInfo;
  final String centerInfo;

  const ReusableRow({
    super.key,
    required this.leftInfo,
    required this.rightInfo,
    required this.centerInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorAssets.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.width * 0.25,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextWidget(
              text: leftInfo,
              textColor: ColorAssets.black,
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: Get.width * 0.2,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorAssets.infoCardColor,
              border: Border.all(color: ColorAssets.black),
            ),
            child: CustomTextWidget(
              text: centerInfo,
              textColor: ColorAssets.white,
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: Get.width * 0.25,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextWidget(
              text: rightInfo,
              textColor: ColorAssets.black,
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  final Function(dynamic) onChanged;
  final PlayerModel? value;
  final ProfileScreenController profileScreenController;
  final List<PlayerModel> players;
  final String imagePath;
  final String type;
  final String rank;
  final List<Color> colorList;
  const TopSection({
    super.key,
    required this.imagePath,
    required this.value,
    required this.type,
    required this.rank,
    required this.profileScreenController,
    required this.players,
    required this.onChanged,
    required this.colorList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            child: Container(
              width: Get.width,
              height: Get.height * 0.2,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorAssets.white),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: colorList),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      imagePath,
                    ),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextWidget(
                    text: type,
                    textColor: ColorAssets.white,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextWidget(
                    text: rank,
                    textColor: ColorAssets.white,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomDropDown(
                dropDownText: "Select a player",
                width: Get.width,
                playerNames: players,
                profileScreenController: profileScreenController,
                onChanged: onChanged,
                value: value),
          )
        ],
      ),
    );
  }
}

class CustomDropDown extends StatefulWidget {
  final ProfileScreenController profileScreenController;
  final List<PlayerModel> playerNames;
  final PlayerModel? value;
  final String dropDownText;
  final Function(dynamic) onChanged;
  final double? width;
  const CustomDropDown(
      {super.key,
      required this.dropDownText,
      this.width,
      required this.playerNames,
      required this.profileScreenController,
      required this.onChanged,
      this.value});
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<PlayerModel>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: CustomTextWidget(
            text: widget.dropDownText,
            textColor: ColorAssets.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        items: widget.playerNames
            .map((PlayerModel item) => DropdownMenuItem<PlayerModel>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: CustomTextWidget(
                      text: item.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
            .toList(),
        value: widget.value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        onChanged: widget.onChanged,
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: context.width,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: ColorAssets.white,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 18,
          iconEnabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
