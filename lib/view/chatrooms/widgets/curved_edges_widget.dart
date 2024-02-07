import 'package:flutter/material.dart';
import 'package:nbatrade/view/chatrooms/widgets/curved_edges.dart';

class CustomCurvedWidget extends StatelessWidget {
  final Widget? child;
  const CustomCurvedWidget({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
