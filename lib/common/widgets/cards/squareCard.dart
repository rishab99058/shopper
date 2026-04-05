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

    // !  Container with side paddings to have edges
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 290,
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
            // Thumbnail, Wishlist, Discount Tag
            AppRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(AppSizes.xs),
              backgroundColor: dark ? AppColors.dark : AppColors.light,
              child: Column(
                children: [
                  // Header Row with Sale Tag and Heart Icon
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.xs,
                      vertical: AppSizes.xs,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Sale Tag
                        if (salePercentage != null)
                          AppRoundedContainer(
                            radius: AppSizes.sm,
                            backgroundColor: AppColors.yellow.withAlpha(200),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.md,
                              vertical: AppSizes.xs,
                            ),
                            child: Text(
                              "$salePercentage%",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: AppColors.black),
                            ),
                          )
                        else
                          const SizedBox(),

                        // Favourite Icon Button
                        AppRoundedContainer(
                          radius: 100,
                          backgroundColor: dark
                              ? AppColors.black.withAlpha(180)
                              : AppColors.white.withAlpha(240),
                          padding: const EdgeInsets.all(AppSizes.xs),
                          child: const Icon(
                            Iconsax.heart5,
                            color: Colors.red,
                            size: AppSizes.iconSm,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Thumbnail Image below the header
                  Expanded(
                    child: Center(
                      child: AppRoundedImage(
                        imageUrl: imageUrl,
                        applyImageRadius: true,
                        isNetworkImage: isNetworkImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppProductTitleText(
                    title: title,
                    smallSize: true,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  if (brandName != null)
                    AppBrandTitleWithVerifiedIcon(
                      title: brandName!,
                    ),
                ],
              ),
            ),

            const Spacer(),

            // Price and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.sm),
                  child: AppProductPriceText(
                    price: price,
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
                    width: AppSizes.iconLg * 1.2,
                    height: AppSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: AppColors.white,
                      ),
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
