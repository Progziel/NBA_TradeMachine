import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final int index;
  final bool selected;
  final VoidCallback onTap;

  const CustomTab({
    required this.text,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.red,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // Adjust text color as needed
          ),
        ),
      ),
    );
  }
}