import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class PickTradePlayerCard extends StatelessWidget {
  const PickTradePlayerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: '2024 Round 1',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'via TOR, IND UTA OR CLE',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
            ),
            VerticalDivider(color: Colors.pink, thickness: 6.0),
            SvgPicture.asset(
              'assets/svgs/76logo.svg',
              height: 60,
              color: ColorAssets.primary,
            ),
            VerticalDivider(color: Colors.black54, thickness: 2.0),
            Icon(Icons.more_vert)

            // Icons and Button
          ],
        ),
      ),
    );
  }
}
