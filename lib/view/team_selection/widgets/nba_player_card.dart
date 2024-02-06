import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/player_chat_model.dart';
import 'package:nbatrade/models/player_model.dart';

class NBAPlayerCard extends StatelessWidget {
  final PlayerChatModel playerModel;
  const NBAPlayerCard({
    super.key,
    required this.playerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            ClipRRect(
              // borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                playerModel.playerImage,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextWidget(
                      text: playerModel.playerName,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: 'SG, 6’ 8” 3.3...',
                      textColor: Colors.grey,
                    ),
                    CustomTextWidget(text: playerModel.playerTeam),
                  ],
                ),
              ),
            ),
            // Icons and Button
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.person_circle,
                    color: ColorAssets.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 80,
                    padding: const EdgeInsets.all(8.0),
                    color: ColorAssets.primary,
                    child: const CustomTextWidget(
                      text: ' + Add',
                      textColor: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
