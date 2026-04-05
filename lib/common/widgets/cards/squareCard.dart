import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/images/roundedImage.dart';
import 'package:shopper/common/widgets/texts/product_title_text.dart';
import 'package:shopper/common/widgets/texts/product_price_text.dart';
import 'package:shopper/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:shopper/common/widgets/custom_shapes/curved_edges/roundedCorner.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class SquareCard extends StatelessWidget {
  const SquareCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.brandName,
    this.salePercentage,
    this.isNetworkImage = true,
    this.onTap,
    this.showBorder = true,
  });

  final String imageUrl, title, price;
  final String? brandName, salePercentage;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = AppDeviceHelpers.isDarkMode(context);
    // Get the screen width to calculate relative sizes
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Use a percentage of screen width or allow the parent Grid/Flex to decide width
        width: screenWidth > 600 ? 200 : 170,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: dark
                  ? AppColors.black.withAlpha(150)
                  : AppColors.darkGrey.withAlpha(20),
              blurRadius: 40,
              spreadRadius: 2,
              offset: const Offset(0, 18),
            ),
          ],
          borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
          color: dark ? AppColors.dark : AppColors.white,
          border: showBorder && !dark
              ? Border.all(color: AppColors.grey.withAlpha(100))
              : null,
        ),
        child: Column(
          children: [
            // Thumbnail Section
            AppRoundedContainer(
              padding: const EdgeInsets.all(AppSizes.xs),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              // Use AspectRatio so the image container scales perfectly with any width
              child: AspectRatio(
                aspectRatio: 1.15,
                child: Stack(
                  // Using Stack to keep icons on top of image
                  children: [
                    // Thumbnail Image
                    Center(
                      child: AppRoundedImage(
                        imageUrl: imageUrl,
                        applyImageRadius: true,
                        isNetworkImage: isNetworkImage,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Header Overlay (Sale Tag & Heart)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (salePercentage != null)
                          AppRoundedContainer(
                            radius: AppSizes.sm,
                            backgroundColor: AppColors.yellow.withAlpha(200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.sm,
                              vertical: AppSizes.xs,
                            ),
                            child: Text(
                              "$salePercentage%",
                              style: Theme.of(context).textTheme.labelLarge!
                                  .apply(color: AppColors.black),
                            ),
                          )
                        else
                          const SizedBox(),

                        // Favorite Icon
                        AppRoundedContainer(
                          radius: 100,
                          backgroundColor: dark
                              ? AppColors.darkGunmetal.withAlpha(180)
                              : AppColors.grey400.withAlpha(240),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.heart5,
                              color: Colors.red,
                              size: AppSizes.iconSm,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), // Closes AspectRatio
            ), // Closes AppRoundedContainer

            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppProductTitleText(title: title, smallSize: true),
                    const SizedBox(height: AppSizes.spaceBtwItems / 4),
                    if (brandName != null)
                      AppBrandTitleWithVerifiedIcon(title: brandName!),
                  ],
                ),
              ),
            ),

            // Spacer ensures the price row stays at the bottom if the card expands
            const Spacer(),

            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  // Wrap price to prevent overflow on tiny screens
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSizes.sm),
                    child: AppProductPriceText(price: price),
                  ),
                ),

                // Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.cardRadiusMd),
                      bottomRight: Radius.circular(AppSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: AppSizes.iconLg,
                    height: AppSizes.iconLg,
                    child: Center(
                      child: Icon(Iconsax.add, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
