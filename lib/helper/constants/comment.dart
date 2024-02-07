import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nbatrade/helper/constants/asset_helper.dart';
import 'package:nbatrade/models/post_model.dart';


class CommentScreen extends StatelessWidget {
  final List<Comments> comments;
  const CommentScreen({required this.comments});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: ListView.builder(
        itemCount:  comments!.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFFF2F2F2),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                     MyAssetHelper.commentProfile,
                    // comments[index].imgUrl!,
                       ), // Replace with actual image
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        comments![index].username!,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF545454),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                        comments![index].comment!,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                    comments![index].time!,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
