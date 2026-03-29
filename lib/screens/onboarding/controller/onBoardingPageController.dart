import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/screens/login/screen/login.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingPageController extends GetxController {
  static OnBoardingPageController get instance => Get.find();

  final storage = GetStorage();

  final pageController = PageController();
  final currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index.toDouble());
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      storage.write("isFirstTime", false);
      Get.to(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
