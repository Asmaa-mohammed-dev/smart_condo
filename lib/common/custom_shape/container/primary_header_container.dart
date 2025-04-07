import 'package:flutter/material.dart';
import 'package:smart_condo/common/custom_shape/curved_edge_widgets.dart';
import 'package:smart_condo/utils/constants/colors.dart';

class NPrimaryHeaderContainer extends StatelessWidget {
  const NPrimaryHeaderContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NCurvedWidget(
      child: Container(
        color: NColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(child: Stack(children: [child])),
      ),
    );
  }
}
