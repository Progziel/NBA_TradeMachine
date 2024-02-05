import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class CustomReusableTab extends StatelessWidget {
  final String text;
  final int index;
  final Color? borderColor;
  final bool selected;
  final bool isIcon;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomReusableTab({
    required this.text,
    this.borderColor,
    required this.isIcon,
    required this.index,
    required this.selected,
    required this.onTap,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: selected ? ColorAssets.primary : ColorAssets.white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: borderColor?? ColorAssets.white
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isIcon?  Icon(icon):SizedBox(),
            SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(
                color: selected ? ColorAssets.white : ColorAssets.borderSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}