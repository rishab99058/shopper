import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:get/get.dart';
import 'package:shopper/navigationMenu.dart';

class VerifySuccessScreen extends StatelessWidget {
  const VerifySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(AppImages.successIllustration),
                width: AppDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                AppTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                AppTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
