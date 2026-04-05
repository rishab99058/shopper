import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/cards/squareCard.dart';
import 'package:shopper/common/widgets/layouts/gridLayout.dart';
import 'package:shopper/screens/homeScreen/model/appCarosoulView.dart';
import 'package:shopper/screens/homeScreen/model/upperPart.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperPart(dark: dark),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppCarosoulView(),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppSectionHeading(
              title1: "Popular Products",
              title2: "View All",
              onPressed: () {},
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: AppGridLayout(
                itemCount: 8,
                itemBuilder: (_, index) {
                  return SquareCard(
                    imageUrl: AppImages.productImage1,
                    title: "Green Nike Air Shoes Original",
                    price: "35.0",
                    brandName: "Nike",
                    salePercentage: "25",
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
