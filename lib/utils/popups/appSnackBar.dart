import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:iconsax/iconsax.dart';

class AppSnackBar {
  AppSnackBar._();

  static void customToast({required message}) {
    final isDark = AppDeviceHelpers.isDarkMode(Get.context!);
    
    Get.rawSnackbar(
      messageText: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: isDark 
                ? const Color(0xFF27272A).withValues(alpha: 0.85) 
                : Colors.white.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isDark 
                  ? Colors.white.withValues(alpha: 0.1) 
                  : Colors.black.withValues(alpha: 0.05),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      snackPosition: SnackPosition.BOTTOM,
      dismissDirection: DismissDirection.horizontal,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 40),
      duration: const Duration(seconds: 3),
      barBlur: 10, // Applies a glass effect to the background behind the pill
      overlayBlur: 0,
    );
  }

  static void _showPremiumSnackbar({
    required String title,
    required String message,
    required Color iconColor,
    required IconData icon,
    int duration = 3,
    bool showProgress = false,
  }) {
    final isDark = AppDeviceHelpers.isDarkMode(Get.context!);
    
    // Smooth Glassy Background
    final backgroundColor = isDark 
        ? const Color(0xFF1F2937).withValues(alpha: 0.85) 
        : Colors.white.withValues(alpha: 0.85);

    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
              color: isDark ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 0.2,
            ),
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          message,
          style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                color: isDark ? Colors.white70 : Colors.black54,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
        ),
      ),
      isDismissible: true,
      shouldIconPulse: false, // Turned off pulse for a more solid, elegant feel
      backgroundColor: backgroundColor,
      barBlur: 20.0, // High blur for beautiful frosted glass effect
      snackPosition: SnackPosition.BOTTOM,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      borderRadius: 20,
      borderWidth: 1.5,
      borderColor: isDark 
          ? Colors.white.withValues(alpha: 0.08) 
          : Colors.black.withValues(alpha: 0.05),
      boxShadows: [
        BoxShadow(
          color: iconColor.withValues(alpha: 0.15),
          blurRadius: 24,
          spreadRadius: 2,
          offset: const Offset(0, 10),
        ),
      ],
      icon: Container(
        margin: const EdgeInsets.only(right: 8, left: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 28),
      ),
      duration: Duration(seconds: duration),
      showProgressIndicator: showProgress,
      progressIndicatorBackgroundColor: iconColor.withValues(alpha: 0.1),
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(iconColor),
      animationDuration: const Duration(milliseconds: 600),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeIn,
    );
  }

  /// Warning Orange Snack bar
  static void warningSnackBar({required title, message = ''}) {
    _showPremiumSnackbar(
      title: title,
      message: message,
      iconColor: const Color(0xFFF59E0B), // Glassy Amber
      icon: Iconsax.warning_2,
    );
  }

  /// Success Green Snack bar
  static void successSnackBar({required title, message = '', duration = 3}) {
    _showPremiumSnackbar(
      title: title,
      message: message,
      iconColor: const Color(0xFF10B981), // Glassy Emerald
      icon: Iconsax.tick_circle,
      duration: duration,
      showProgress: true,
    );
  }

  /// Error Red Snack bar
  static void errorSnackBar({required title, message = ''}) {
    _showPremiumSnackbar(
      title: title,
      message: message,
      iconColor: const Color(0xFFEF4444), // Glassy Crimson
      icon: Iconsax.info_circle,
      duration: 4,
    );
  }
}
