import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: context.height * 0.05,
        child: TextFormField(
          onChanged: onChanged,
          decoration: const InputDecoration(
            label: CustomTextWidget(text: 'Search by Name'),
            suffixIcon: Icon(
              CupertinoIcons.search,
              color: ColorAssets.primary,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorAssets.primary)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorAssets.primary)),
            labelStyle: TextStyle(
              fontSize: 14.0,
              color: ColorAssets.primary,
              fontWeight: FontWeight.w200,
            ),
          ),
          style: const TextStyle(
            fontSize: 14.0,
            color: ColorAssets.primary,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
