import 'package:flutter/material.dart';

class CustomStoryWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  CustomStoryWidget({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      margin: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              backgroundImage: AssetImage(imageUrl),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
