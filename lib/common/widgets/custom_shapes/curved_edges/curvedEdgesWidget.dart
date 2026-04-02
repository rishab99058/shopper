import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/custom_shapes/curved_edges/curvedEdges.dart';

class AppCurvedEdgesWidget extends StatelessWidget {
  const AppCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppCurvedEdges(),
      child: child,
    );
  }
}
