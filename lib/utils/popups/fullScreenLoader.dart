import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/common/widgets/loaders/animationLoader.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppFullscreenloader {
  static void openLoadingDialog(String text) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AppDeviceHelpers.isDarkMode(Get.context!)
              ? AppColors.dark
              : AppColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              /// Extra Space
              const SizedBox(height: 250),

              /// Animation
              AppAnimationLoader(text: text),
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
