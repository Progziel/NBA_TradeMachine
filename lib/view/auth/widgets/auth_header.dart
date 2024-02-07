import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/auth_header.png'),
        Positioned(
          top: context.height * 0.07,
          right: 0,
          left: 0,
          child: const Center(
            child: CustomTextWidget(
              text: 'NBA\nTrade Machine',
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              textColor: ColorAssets.light,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        )
      ],
    );
  }
}
