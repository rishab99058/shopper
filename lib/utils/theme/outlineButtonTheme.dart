import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';

class CustomOutlineButtonTheme {
  CustomOutlineButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.dark,
      side: const BorderSide(color: AppColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.light,
      side: const BorderSide(color: AppColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      ),
    ),
  );
}
