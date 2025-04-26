import 'package:flutter/material.dart';
import 'package:smart_condo/utils/constants/image_strings.dart';
import 'package:smart_condo/utils/constants/text_strings.dart';

class NLoginHeaderOther extends StatelessWidget {
  const NLoginHeaderOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(height: 130, width: 170, image: AssetImage(NImages.appLogo)),
        Text(
          NTexts.loginSubTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
