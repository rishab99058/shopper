import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/cards/squareCard.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/common/widgets/layouts/gridLayout.dart';
import 'package:shopper/screens/homeScreen/model/customTab.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeaderContainer(
              size: 180, // Match the height
              color: AppColors.phthaloGreen,
              child: CustomAppBar(title: "", subTitle: "Wishlist"),
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            AppSectionHeading(
              title1: "My Wishlist",
              title2: "Add Products",
              onPressed: () {},
            ),

            const SizedBox(height: AppSizes.spaceBtwSections),

            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.sm,
                right: AppSizes.sm,
              ),
              child: AppGridLayout(
                itemCount: 100,

                itemBuilder: (context, index) {
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
