import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final double? fontSize;
  const   CustomTextWidget({Key? key,required this.text,this.fontWeight,this.textColor,this.fontSize,

    this.align,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align??TextAlign.start,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 12.0,
        fontFamily: 'Nunito',
       // overflow: TextOverflow.ellipsis,
      ),
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      //textWidthBasis: TextWidthBasis.parent,
    );
  }
}
