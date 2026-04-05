import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/searchBar/searchBar.dart';
import 'package:shopper/common/widgets/verticalImageText/verticalImageText.dart';
import 'package:shopper/screens/homeScreen/model/customTab.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 350),

        HomeHeaderContainer(
          color: AppColors.tertiary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- App bar
              CustomAppBar(
                title: AppTexts.homeAppbarTitle,
                subTitle: AppTexts.homeAppbarSubTitle,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              /// -- Heading
              Padding(
                padding: const EdgeInsets.only(left: AppSizes.spaceBtwSections),
                child: Text(
                  AppTexts.popularCategories,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.apply(color: AppColors.white),
                ),
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              Padding(
                padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return VerticalCategory(
                        title: 'Shoes',
                        image: AppImages.shoesIcon,
                        textColor: AppColors.white,
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0,
          left: 20,
          right: 20,
          child: AppSearchBar(dark: dark),
        ),
      ],
    );
  }
}
