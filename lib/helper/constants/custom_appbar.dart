import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'colors.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? prefixIconOnTap;
  final void Function()? sufixWidgetOnTap;
  final IconData? prefixIcon;
  final Widget? sufixWidget;
  final String title;

   const CustomAppBar({
    Key? key,
    this.prefixIcon,
    required this.title,
    this.prefixIconOnTap,
    this.sufixWidget,
    this.sufixWidgetOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.8,
      decoration: const BoxDecoration(
        color: ColorAssets.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(onTap: prefixIconOnTap, child: Icon(prefixIcon)),
              CustomTextWidget(text: title, textColor: ColorAssets.white),
              if (sufixWidget != null)
                InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
            ],
          ),
          CustomTextFormField(
            hint: "Search",
            validator: (value) => value, // Add a simple validator here
          ),
        ],
      ),
    );
  }
}


