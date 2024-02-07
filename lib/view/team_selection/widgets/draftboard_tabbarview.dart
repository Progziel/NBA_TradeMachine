import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/helper/constants/custom_textfield.dart';
import 'package:nbatrade/models/player_chat_model.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/view/team_selection/widgets/nba_player_card.dart';

class Draftboard extends StatelessWidget {
  const Draftboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.grey.shade300,
          child: ListView(
            children: [
              const CustomTextWidget(
                text: 'Your Draft Board',
                textColor: ColorAssets.primary,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: context.height * 0.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: playerChatModel.length,
                  itemBuilder: (context, index) {
                    return ReorderableDelayedDragStartListener(
                      key: ValueKey(index),
                      index: index,
                      child: NBAPlayerCard(playerModel: playerChatModel[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: context.height * 0.01),
              const CustomTextWidget(
                text: 'Draft Board Summary & Analysis',
                textColor: ColorAssets.primary,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: context.height * 0.01),
              Row(
                children: [
                  const CircleAvatar(backgroundColor: Colors.grey, radius: 30),
                  const SizedBox(width: 6.0),
                  const Flexible(
                      child: CustomTextFormField(
                    hint: 'Write Something...',
                    maxLines: 15,
                    fillColor: Colors.white,
                  //  borderRadius: 0,
                  )),
                  const SizedBox(width: 6.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 80,
                      padding: const EdgeInsets.all(8.0),
                      color: ColorAssets.primary,
                      child: const CustomTextWidget(
                        text: 'Create Post',
                        textColor: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
