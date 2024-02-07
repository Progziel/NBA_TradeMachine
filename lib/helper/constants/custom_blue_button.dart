



import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class CustomBlueButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  const CustomBlueButton( {

    super.key, required this.text,
     this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),

      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: ColorAssets.primary,
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: ColorAssets.white,size: 18,),
          SizedBox(width: 5,),

          CustomTextWidget(text: text,textColor: ColorAssets.white,
            fontWeight: FontWeight.bold,fontSize: 15,

          ),
        ],
      ),
    );
  }
}
