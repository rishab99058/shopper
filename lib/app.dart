import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/theme/appTheme.dart';
import 'package:shopper/screens/onboarding/screen/onBoarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
