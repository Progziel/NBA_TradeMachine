import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final int index;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomTab({
    required this.text,
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
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
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