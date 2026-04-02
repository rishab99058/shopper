import 'package:flutter/material.dart';
import 'package:shopper/screens/homeScreen/model/homeHeaderContainer.dart';

import 'package:shopper/common/widgets/appBar/appBar.dart';
import 'package:shopper/common/widgets/products/cart/cartCounterIcon.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            HomeHeaderContainer(
              child: Column(
                children: [
                  /// -- App bar
                  ShopperAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: AppColors.grey),
                        ),
                        Text(
                          AppTexts.homeAppbarSubTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: AppColors.white),
                        ),
                      ],
                    ),
                    actions: [
                      CartCounterIcon(
                        onPressed: () {},
                        iconColor: AppColors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
