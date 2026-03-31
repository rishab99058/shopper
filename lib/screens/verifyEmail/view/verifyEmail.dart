import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/screens/verifyEmail/controller/verifyEmailController.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class VerifyEmail extends StatelessWidget {
  final String? email;
  const VerifyEmail({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(AppImages.verifyEmail),
                width: AppDeviceHelpers.getScreenWidth(context) * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                AppTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                AppTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendVerificationEmail(),
                  child: const Text(AppTexts.resend),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
