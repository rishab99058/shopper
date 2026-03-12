import 'package:flutter/material.dart';
import 'package:shopper/utils/theme/appBarTheme.dart';
import 'package:shopper/utils/theme/bottomSheetTheme.dart';
import 'package:shopper/utils/theme/checkBoxTheme.dart';
import 'package:shopper/utils/theme/chipTheme.dart';
import 'package:shopper/utils/theme/elevatedButtonTheme.dart';
import 'package:shopper/utils/theme/outlineButtonTheme.dart';
import 'package:shopper/utils/theme/textFormFieldTheme.dart';
import 'package:shopper/utils/theme/textTheme.dart';
import 'package:shopper/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    disabledColor: Colors.grey,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButton.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    disabledColor: Colors.grey,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButton.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
  );
}
