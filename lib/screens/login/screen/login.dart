import 'package:flutter/material.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/screens/login/model/loginForm.dart';
import 'package:shopper/screens/login/controller/loginController.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.defaultSpace,
          horizontal: AppSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.sm),
            Text(
              AppTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),

            LoginForm(controller: controller, dark: dark),
          ],
        ),
      ),
    );
  }
}
