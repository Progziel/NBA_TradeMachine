import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double? width;
  final bool showBackgroundColor;
  const CustomButton(
      {super.key,
        required this.buttonText,
        required this.onTap,
        this.width,
        required this.showBackgroundColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          width: width ?? 150,
          decoration: BoxDecoration(
              color: showBackgroundColor
                  ? ColorAssets.primary
                  : Colors.transparent,
              border: Border.all(
                  width: 2.0,
                  color: showBackgroundColor
                      ? Colors.transparent
                      : ColorAssets.primary),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 14.0,
                    color: showBackgroundColor ? Colors.white : ColorAssets.primary,
                    fontWeight: FontWeight.w500),
              ))),
    );
  }
}