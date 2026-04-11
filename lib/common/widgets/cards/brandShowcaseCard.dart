import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/custom_shapes/curved_edges/roundedCorner.dart';
import 'package:shopper/common/widgets/loaders/shimmer.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';

class BrandShowcaseCard extends StatelessWidget {
  const BrandShowcaseCard({
    super.key,
    required this.dark,
    required this.images,
  });

  final bool dark;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: dark
                ? AppColors.black.withAlpha(150)
                : AppColors.darkerGrey.withAlpha(80),
            blurRadius: 40,
            spreadRadius: 2,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: AppRoundedContainer(
        showBorder: true,
        borderColor: dark ? AppColors.darkGrey : AppColors.grey,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(AppSizes.md),
        margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            // Top Row: Brand Profile
            Row(
              children: [
                AppRoundedContainer(
                  width: 50,
                  height: 50,
                  backgroundColor: dark ? AppColors.black : AppColors.white,
                  padding: const EdgeInsets.all(AppSizes.sm),
                  child: Image.network(
                    "https://res.cloudinary.com/dws1oujlk/image/upload/v1775391809/bata_zl6obe.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: AppSizes.spaceBtwItems),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Nike",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: AppSizes.xs),
                        const Icon(
                          Icons.verified,
                          color: AppColors.primary,
                          size: AppSizes.iconSm,
                        ),
                      ],
                    ),
                    Text(
                      "256 Products",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),

            // Bottom Row: 3 Product Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    return Expanded(
      child: AppRoundedContainer(
        height: 100,
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.light,
        margin: const EdgeInsets.only(right: AppSizes.sm),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Image.network(
          image,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            // Shimmer effect while loading the image!
            return AppShimmerEffect(width: 100, height: 100, radius: 15);
          },
        ),
      ),
    );
  }
}
