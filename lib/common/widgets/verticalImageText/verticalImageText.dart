import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/circularContainer/circularContainer.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class VerticalCategory extends StatelessWidget {
  const VerticalCategory({
    super.key,
    required this.title,
    required this.image,
    required this.textColor,
    this.backgroundColor,
    this.onTap,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
        child: Column(
          children: [
            AppCircularContainer(
              width: 56,
              height: 56,
              backgroundColor:
                  backgroundColor ??
                  (AppDeviceHelpers.isDarkMode(context)
                      ? AppColors.dark.withAlpha(100)
                      : AppColors.light.withAlpha(100)),
              padding: const EdgeInsets.all(AppSizes.sm),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: (AppDeviceHelpers.isDarkMode(context)
                      ? AppColors.light
                      : AppColors.dark),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
