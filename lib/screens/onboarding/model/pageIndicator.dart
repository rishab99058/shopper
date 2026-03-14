import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shopper/screens/onboarding/controller/onBoardingPageController.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final pageController = OnBoardingPageController.instance;

    return Positioned(
      bottom: AppDeviceHelpers.getBottomNavigationBarHeight() * 6,
      left: AppDeviceHelpers.getScreenWidth(context) / 2.6,
      right: AppDeviceHelpers.getScreenWidth(context) / 2.3,
      child: SmoothPageIndicator(
        controller: pageController.pageController,
        onDotClicked: pageController.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? AppColors.light : AppColors.dark,
          dotHeight: 5,
        ),
      ),
    );
  }
}
