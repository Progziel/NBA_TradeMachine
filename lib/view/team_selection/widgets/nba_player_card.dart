import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/player_chat_model.dart';
import 'package:nbatrade/models/player_model.dart';

class NBAPlayerCard extends StatelessWidget {
  final PlayerChatModel playerModel;
  final bool showAddIcon;
  const NBAPlayerCard({
    super.key,
    required this.playerModel,
    this.showAddIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/user-profile.jpg',
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
                      const CustomTextWidget(
                        text: 'SG, 6’ 8” 3.3...',
                        textColor: Colors.grey,
                      ),
                      CustomTextWidget(text: playerModel.playerTeam),
                    ],
                  ),
                ),
              ),
              // Icons and Button
              showAddIcon
                  ? Column(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                color: ColorAssets.primary,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: const CustomTextWidget(
                              text: ' + Add',
                              textColor: Colors.white,
                              textAlign: TextAlign.center,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.edit, color: ColorAssets.primary),
                              Icon(
                                Icons.cancel_outlined,
                                color: ColorAssets.black,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_up,
                                  color: ColorAssets.primary),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: ColorAssets.black,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
