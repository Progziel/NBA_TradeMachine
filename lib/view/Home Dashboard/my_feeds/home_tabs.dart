import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final int index;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomTab(
      {required this.text,
      required this.index,
      required this.selected,
      required this.onTap,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: selected ? ColorAssets.primary : ColorAssets.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? ColorAssets.white : ColorAssets.textPrimary,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10,
                color:
                    selected ? ColorAssets.white : ColorAssets.borderSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
