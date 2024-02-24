import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';


class CustomTextDropdown extends StatelessWidget {
   const CustomTextDropdown({Key? key,this.onTap,required this.text,required this.dropdown}) : super(key: key);
   final void Function()? onTap;
   final String text;
  final bool dropdown;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomTextWidget(text: text),
          dropdown == false ? Icon(Icons.arrow_drop_up) :Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

