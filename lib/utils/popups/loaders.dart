import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_condo/utils/constants/colors.dart';
import 'package:smart_condo/utils/helpers/helper_functions.dart';

class TLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  static customToast({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                NHelperFunctions.isDarkMode(Get.context!)
                    ? NColors.dark
                    : NColors.white,
          ),
          child: Center(
            child: Text(
              message,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      duration: Duration(seconds: duration),
      backgroundColor: NColors.primary,
      margin: const EdgeInsets.all(20),
      colorText: Colors.white,
      icon: const Icon(Iconsax.check, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.orange,
      margin: const EdgeInsets.all(20),
      colorText: Colors.white,
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      margin: const EdgeInsets.all(20),
      colorText: Colors.white,
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
