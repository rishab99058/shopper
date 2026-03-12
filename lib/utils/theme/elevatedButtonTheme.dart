import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';

class CustomElevatedButton {
  CustomElevatedButton._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.buttonDisabled,
      side: const BorderSide(color: AppColors.light),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.light,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.darkGrey,
      disabledBackgroundColor: AppColors.darkerGrey,
      side: const BorderSide(color: AppColors.primary),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
    ),
  );
}
