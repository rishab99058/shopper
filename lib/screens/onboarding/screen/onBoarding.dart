import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/screens/onboarding/model/pageIndicator.dart';
import 'package:shopper/screens/onboarding/model/skipButton.dart';
import 'package:shopper/screens/onboarding/model/onBoardingSlide.dart';
import 'package:shopper/utils/constants/images.dart' show AppImages;
import 'package:shopper/utils/constants/text.dart' show AppTexts;
import 'package:shopper/screens/onboarding/controller/onBoardingPageController.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingPageController());
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingSlide(
                image: AppImages.onBoardingImage1,
                title: AppTexts.onBoardingTitle1,
                subTitle: AppTexts.onBoardingSubTitle1,
              ),
              OnBoardingSlide(
                image: AppImages.onBoardingImage2,
                title: AppTexts.onBoardingTitle2,
                subTitle: AppTexts.onBoardingSubTitle2,
              ),
              OnBoardingSlide(
                image: AppImages.onBoardingImage3,
                title: AppTexts.onBoardingTitle3,
                subTitle: AppTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Dot Navigation SmoothPageIndicator
          PageIndicator(dark: dark),

          SkipButton(),

          Positioned(
            right: 20,
            bottom: 100,
            child: AppElevatedButton(
              onPressed: controller.nextPage,
              child: Obx(
                () => Text(
                  controller.currentPageIndex.value == 2
                      ? "Get Started"
                      : "Next",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
