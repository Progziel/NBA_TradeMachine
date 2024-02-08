import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/helper/constants/searchbar.dart';
import 'package:nbatrade/models/player_chat_model.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/view/team_selection/widgets/nba_player_card.dart';

class Draftboard extends StatelessWidget {
  const Draftboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: ColorAssets.primaryBackground,
              borderRadius: BorderRadius.circular(12.0)),
          child: ListView(
            children: [
              CustomSearchBar(),
              Card(
                elevation: 5.0,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 255),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text: 'Your Draft Board',
                        textColor: ColorAssets.primary,
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        color: Colors.transparent,
                        height: context.height * 0.4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: playerChatModel.length,
                          itemBuilder: (context, index) {
                            return ReorderableDelayedDragStartListener(
                              key: ValueKey(index),
                              index: index,
                              child: NBAPlayerCard(
                                playerModel: playerChatModel[index],
                                showAddIcon: false,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.01),
              const CustomTextWidget(
                text: 'Draft Board Summary & Analysis',
                textColor: ColorAssets.primary,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: context.height * 0.01),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage:
                            AssetImage(MyAssetHelper.profileScreenImage),
                        radius: 25),
                    const SizedBox(width: 6.0),
                    Expanded(
                        child: SizedBox(
                      height: context.height * 0.06,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: CustomTextWidget(
                              text: 'Write Draft Board Summary'),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorAssets.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorAssets.primary)),
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
                    )),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: ColorAssets.primary,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const CustomTextWidget(
                        text: 'Create Post',
                        textColor: Colors.white,
                        fontSize: 12.0,
                        textAlign: TextAlign.center,
                      ),
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
