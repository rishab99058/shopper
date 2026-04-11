import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/loaders/shimmer.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/cacheHelper.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding = AppSizes.sm,
    this.isNetworkImage = false,
    this.isFileImage = false,
    this.showBorder = false,
    this.borderColor = AppColors.primary,
    this.imageUrl = "",
    this.borderWidth = 1.0,
  });

  final BoxFit? fit;
  final bool isNetworkImage;
  final bool isFileImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final dark = AppDeviceHelpers.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? AppColors.dark : AppColors.light),
        borderRadius: BorderRadius.circular(100),
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: fit,
                cacheManager: TCacheHelper.productCacheManager,
                placeholder: (context, url) =>
                    AppShimmerEffect(width: width, height: height),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            : isFileImage
                ? Image.file(File(imageUrl), fit: fit)
                : Image(fit: fit, image: AssetImage(imageUrl)),
      ),
    );
  }
}
