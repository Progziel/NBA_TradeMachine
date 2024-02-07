import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/colors.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';
import 'package:nbatrade/models/player_chat_model.dart';
import 'package:nbatrade/models/player_model.dart';
import 'package:nbatrade/view/team_selection/widgets/nba_player_card.dart';

class SGView extends StatelessWidget {
  const SGView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey.shade300,
        child: ListView(
          children: [
            const CustomTextWidget(
              text: '2024 Prospects',
              textColor: ColorAssets.primary,
              textAlign: TextAlign.start,
            ),
            ReorderableListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playerChatModel.length,
              onReorder: (int oldIndex, int newIndex) {
                // Implement the logic to reorder your list items
                // Update your data structure accordingly
                // For example: myDataList.insert(newIndex, myDataList.removeAt(oldIndex));
              },
              itemBuilder: (context, index) {
                return ReorderableDelayedDragStartListener(
                  key: ValueKey(index),
                  index: index,
                  child: NBAPlayerCard(playerModel: playerChatModel[index]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
