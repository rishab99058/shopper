import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:shopper/screens/onboarding/controller/onBoardingPageController.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = OnBoardingPageController.instance;
    return Positioned(
      top: AppDeviceHelpers.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: pageController.skipPage,
        child: Text("Skip", style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
