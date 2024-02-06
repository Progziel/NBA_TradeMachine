import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            // Profile Image
            ClipRRect(
              // borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                'https://designimages.appypie.com/profilepicture/profilepicture-2-portrait-head.jpg',
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextWidget(
                      text: 'James Anderson ',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'SG, 6’ 8” 3.3...',
                      textColor: Colors.grey,
                    ),
                    CustomTextWidget(text: '\$19.6M | 7 years'),
                  ],
                ),
              ),
            ),
            VerticalDivider(color: Colors.pink, thickness: 6.0),
            Image.asset('assets/images/trade-rank-1.png', height: 60),
            VerticalDivider(color: Colors.black54, thickness: 2.0),
            Icon(Icons.more_vert)

            // Icons and Button
          ],
        ),
      ),
    );
  }
}