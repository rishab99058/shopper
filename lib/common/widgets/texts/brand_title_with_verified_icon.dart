import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/texts/brand_title_text.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/enums.dart';
import 'package:shopper/utils/constants/sizes.dart';

class AppBrandTitleWithVerifiedIcon extends StatelessWidget {
  const AppBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: AppBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: AppSizes.iconXs,
        ),
      ],
    );
  }
}
