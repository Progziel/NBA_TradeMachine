import 'package:flutter/material.dart';
import 'package:nbatrade/helper/constants/custom_text.dart';

class ReUsableProfileTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget? suffixWidget;
  final VoidCallback onTap;
  const ReUsableProfileTabs(
      {super.key,
      required this.text,
      required this.icon,
      required this.onTap,
      this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: Row(
          children: [
            Icon(icon, size: 25),
            const SizedBox(width: 15.0),
            CustomTextWidget(
              text: text,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              textColor: Colors.black,
            ),
            const Spacer(),
            suffixWidget ??
                Icon(Icons.arrow_forward_ios, size: 25, color: Colors.black87)
          ],
        ),
      ),
    );
  }
}
