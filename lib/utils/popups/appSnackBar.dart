import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:iconsax/iconsax.dart';

class AppSnackBar {
  AppSnackBar._();

  static void customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppDeviceHelpers.isDarkMode(Get.context!)
                ? AppColors.darkerGrey.withValues(alpha: 0.6)
                : AppColors.white.withValues(alpha: 0.7),
            border: Border.all(
              color: AppColors.grey.withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }

  /// Warning Orange Snack bar
  static void warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppDeviceHelpers.isDarkMode(Get.context!)
          ? Colors.white
          : Colors.black,
      backgroundColor: Colors.amber.withValues(alpha: 0.2), // Glassy Amber
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      borderRadius: 12,
      borderWidth: 2.0,
      borderColor: const Color(0xFFF59E0B), // Solid Amber Border
      icon: const Icon(Iconsax.warning_2, color: Color(0xFFF59E0B), size: 28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      overlayBlur: 2.0,
    );
  }

  /// Success Green Snack bar
  static void successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppDeviceHelpers.isDarkMode(Get.context!)
          ? Colors.white
          : Colors.black,
      backgroundColor: const Color(
        0xFF10B981,
      ).withValues(alpha: 0.15), // Glassy Emerald
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      borderRadius: 12,
      borderWidth: 2.0,
      borderColor: const Color(0xFF10B981), // Solid Emerald Border
      icon: const Icon(Iconsax.tick_circle, color: Color(0xFF10B981), size: 28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      overlayBlur: 2.0,
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: const Color(
        0xFF10B981,
      ).withValues(alpha: 0.1),
      progressIndicatorValueColor: const AlwaysStoppedAnimation<Color>(
        Color(0xFF10B981),
      ),
    );
  }

  /// Error Red Snack bar
  static void errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: AppDeviceHelpers.isDarkMode(Get.context!)
          ? Colors.white
          : Colors.black,
      backgroundColor: const Color(
        0xFFEF4444,
      ).withValues(alpha: 0.15), // Glassy Crimson
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 4),
      margin: const EdgeInsets.all(20),
      borderRadius: 12,
      borderWidth: 2.0,
      borderColor: const Color(0xFFEF4444), // Solid Crimson Border
      icon: const Icon(Iconsax.info_circle, color: Color(0xFFEF4444), size: 28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      overlayBlur: 2.0,
    );
  }
}
