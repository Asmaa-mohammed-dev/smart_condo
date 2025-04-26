import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_condo/features/authentication/screens/first/first_page.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();
  //variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  //update current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;
  // Jump to the

  // Jump to the specific dot selected page

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }
  // Update current Index & jump to next page

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      // Get.offAll(const LoginScreen());
      Get.offAll(const FirstPage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Update Current Index& jump to the last page

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
