



import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  const CustomBlueButton({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),

      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: ColorAssets.primary,
      ),
      child:Center(child:
      CustomTextWidget(text: text,textColor: ColorAssets.white,
        fontWeight: FontWeight.bold,fontSize: 20,

      )
      ),
    );
  }
}
