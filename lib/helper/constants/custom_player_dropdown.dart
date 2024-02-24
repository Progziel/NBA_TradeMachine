import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_screen_controller.dart';
import '../../models/player_model.dart';
import 'colors.dart';
import 'custom_text.dart';

class CustomPlayerDropDown extends StatefulWidget {
  final ProfileScreenController profileScreenController;
  final List<PlayerModel> playerNames;
  final PlayerModel? value;
  final String dropDownText;
  final Function(dynamic) onChanged;
  final double? width;
  const CustomPlayerDropDown(
      {super.key,
        required this.dropDownText,
        this.width,
        required this.playerNames,
        required this.profileScreenController,
        required this.onChanged,
        this.value});
  @override
  State<CustomPlayerDropDown> createState() => _CustomPlayerDropDownState();
}

class _CustomPlayerDropDownState extends State<CustomPlayerDropDown> {
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
              text: item.name ?? "",
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