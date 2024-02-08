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
      height: Get.height / 4,
      decoration: const BoxDecoration(
        color: ColorAssets.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(85, 0, 0, 0),
            blurRadius: 5.0, // Adjust blur radius as needed
            offset: Offset(0, 6), // Offset shadow only on the bottom
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: context.height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: prefixIconOnTap,
                    child: Icon(
                      prefixIcon,
                      color: ColorAssets.white,
                    )),
                CustomTextWidget(
                    text: title,
                    textColor: ColorAssets.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                if (sufixWidget != null)
                  InkWell(onTap: sufixWidgetOnTap, child: sufixWidget!),
                if (sufixWidget == null) const SizedBox()
              ],
            ),
          ),
          SizedBox(height: context.height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40),
            child: CustomTextFormField(
              hint: "Search",
              hintTextColor: ColorAssets.textLightGrey,
              sufixIcon: const Icon(
                Icons.search,
                size: 20,
              ),
              validator: (value) => value, // Add a simple validator here
            ),
          ),
        ],
      ),
    );
  }
}
