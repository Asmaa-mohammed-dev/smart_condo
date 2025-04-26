import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/common/custom_shape/app_bar/app_bar.dart';
import 'package:smart_condo/data/repositories/authentication.dart';

import 'package:smart_condo/utils/constants/text_strings.dart';

class NHomeAppBar extends StatelessWidget {
  const NHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<UserModel>()) {
      return const NAppBar(
        title: Text(
          'جاري التحميل...',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'MAJALLA',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );
    }
    UserModel newUser = Get.find<UserModel>();
    return NAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            newUser.username,
            // NTexts.homeAppbarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            NTexts.homeAppbarSubTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'MAJALLA',
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
      // actions: [NCartCountericon(onPressed: () {}, iconColor: NColors.white)],
    );
  }
}
