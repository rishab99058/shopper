// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/custom_shapes/curved_edges/roundedCorner.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.dark,
    required this.brandName,
    required this.brandImage,
    required this.productCount,
    this.onTap,
  });

  final bool dark;
  final String brandName;
  final String brandImage;
  final String productCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppRoundedContainer(
      height: 80,
      width: AppDeviceHelpers.getScreenWidth(context) * 0.5,
      showBorder: true,
      backgroundColor: dark ? AppColors.darkCard : AppColors.white,
      padding: const EdgeInsets.all(AppSizes.md),
      child: Row(
        children: [
          Image.network(brandImage, height: 60, width: 60),
          const SizedBox(width: AppSizes.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    brandName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Icon(Icons.verified, color: AppColors.primary),
                ],
              ),
              Text(
                "$productCount Products",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
