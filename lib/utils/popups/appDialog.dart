import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppDialog {
  AppDialog._();

  /// A beautiful, customizable, modern dialog box
  static void showCustomDialog({
    required String title,
    required String description,
    IconData icon = Iconsax.info_circle,
    Color iconColor = AppColors.primary,
    Color iconBackgroundColor = const Color(0xFFEFF6FF), // Light blue tint
    String primaryButtonText = 'Confirm',
    VoidCallback? onPrimaryPressed,
    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
    bool isDismissible = true,
  }) {
    // Current theme
    final context = Get.context!;
    final isDark = AppDeviceHelpers.isDarkMode(context);

    // Dialog theme colors based on dark/light mode
    final backgroundColor = isDark
        ? const Color(0xFF1F2937).withValues(
            alpha: 0.85,
          ) // Transparent Slate for Dark
        : Colors.white.withValues(alpha: 0.9); // Transparent White for Light

    final borderColor = isDark
        ? Colors.white.withValues(alpha: 0.1)
        : AppColors.grey.withValues(alpha: 0.2);

    final textColor = isDark ? Colors.white : AppColors.black;
    final subtitleColor = isDark ? Colors.grey[400] : Colors.grey[600];

    Get.dialog(
      barrierDismissible: isDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.4), // Subtle dark backdrop
      TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0.8, end: 1.0),
        curve: Curves.easeOutBack,
        builder: (context, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: Opacity(opacity: scale.clamp(0.0, 1.0), child: child),
          );
        },
        child: Dialog(
          backgroundColor: Colors
              .transparent, // Required for BackdropFilter to work on dialog
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Glassmorphism Container
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
                  margin: const EdgeInsets.only(
                    top: 36,
                  ), // Margin for circular icon
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: borderColor, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                      // Inner glow effect
                      BoxShadow(
                        color: Colors.white.withValues(
                          alpha: isDark ? 0.05 : 0.5,
                        ),
                        blurRadius: 10,
                        spreadRadius: -5,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              letterSpacing: 0.5,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),

                      // Description
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: subtitleColor,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),

                      // Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (secondaryButtonText != null) ...[
                            Expanded(
                              child: OutlinedButton(
                                onPressed:
                                    onSecondaryPressed ?? () => Get.back(),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  side: BorderSide(color: borderColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  foregroundColor: textColor,
                                ),
                                child: Text(
                                  secondaryButtonText,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],

                          Expanded(
                            child: ElevatedButton(
                              onPressed: onPrimaryPressed ?? () => Get.back(),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                backgroundColor: iconColor,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Text(
                                primaryButtonText,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Floating Icon at Top
              Positioned(
                top: 0,
                child: Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF374151) : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: borderColor, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: iconColor.withValues(alpha: 0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                        color: iconBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: iconColor, size: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Pre-configured variations for convenience

  static void showSuccess({
    required String title,
    required String description,
    VoidCallback? onPrimaryPressed,
    String primaryButtonText = 'Continue',
  }) {
    showCustomDialog(
      title: title,
      description: description,
      icon: Iconsax.tick_circle,
      iconColor: const Color(0xFF10B981), // Emerald
      iconBackgroundColor: const Color(0xFF10B981).withValues(alpha: 0.15),
      primaryButtonText: primaryButtonText,
      onPrimaryPressed: onPrimaryPressed,
      isDismissible: false,
    );
  }

  static void showError({
    required String title,
    required String description,
    VoidCallback? onPrimaryPressed,
    String primaryButtonText = 'Okay',
  }) {
    showCustomDialog(
      title: title,
      description: description,
      icon: Iconsax.info_circle,
      iconColor: const Color(0xFFEF4444), // Crimson
      iconBackgroundColor: const Color(0xFFEF4444).withValues(alpha: 0.15),
      primaryButtonText: primaryButtonText,
      onPrimaryPressed: onPrimaryPressed,
    );
  }

  static void showWarning({
    required String title,
    required String description,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    String primaryButtonText = 'Confirm',
    String secondaryButtonText = 'Cancel',
  }) {
    showCustomDialog(
      title: title,
      description: description,
      icon: Iconsax.warning_2,
      iconColor: const Color(0xFFF59E0B), // Amber
      iconBackgroundColor: const Color(0xFFF59E0B).withValues(alpha: 0.15),
      primaryButtonText: primaryButtonText,
      onPrimaryPressed: onPrimaryPressed,
      secondaryButtonText: secondaryButtonText,
      onSecondaryPressed: onSecondaryPressed,
    );
  }

  static void showConfirm({
    required String title,
    required String description,
    required VoidCallback onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
    String primaryButtonText = 'Yes',
    String secondaryButtonText = 'No',
  }) {
    showCustomDialog(
      title: title,
      description: description,
      icon: Iconsax.message_question,
      iconColor: AppColors.primary,
      iconBackgroundColor: AppColors.primary.withValues(alpha: 0.15),
      primaryButtonText: primaryButtonText,
      onPrimaryPressed: onPrimaryPressed,
      secondaryButtonText: secondaryButtonText,
      onSecondaryPressed: onSecondaryPressed,
    );
  }
}
