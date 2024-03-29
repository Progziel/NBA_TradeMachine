import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? fontSize;
  final int? maxLines;
  final FontStyle? fontStyle;
  const CustomTextWidget(
      {Key? key,
        required this.text,
        this.fontWeight,
        this.textColor,
        this.fontSize,
        this.textAlign,
        this.fontStyle,
        this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,

      style: TextStyle(
          color: textColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontSize: fontSize ?? 12.0,
          fontFamily: 'Nunito',
          fontStyle: fontStyle ?? FontStyle.normal

        // overflow: TextOverflow.ellipsis,
      ),
      softWrap: true,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      //textWidthBasis: TextWidthBasis.parent,
    );
  }
}
