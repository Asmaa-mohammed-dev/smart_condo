import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_condo/common/loaders/animation_loader.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: NHelperFunctions.isDarkMode(Get.context!)
              ? NColors.dark
              : NColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                  showAction: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Stop loading
  static stoploading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
