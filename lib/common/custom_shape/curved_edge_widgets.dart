import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/curved_edges.dart';

class NCurvedWidget extends StatelessWidget {
  const NCurvedWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: NCustomCurvedEdges(), child: child);
  }
}
