import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/sizes.dart';

class AppGridLayout extends StatelessWidget {
  const AppGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
    this.crossAxisCount, // Optional parameter to override dynamically calculated columns
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final int? crossAxisCount; // Override value 

  @override
  Widget build(BuildContext context) {
    int finalCrossAxisCount;

    if (crossAxisCount != null) {
      // Use the exact amount of columns requested by the user
      finalCrossAxisCount = crossAxisCount!;
    } else {
      // Fallback to responsive mobile-first logic
      final screenWidth = MediaQuery.of(context).size.width;
      finalCrossAxisCount = 2; // Default for mobile
      if (screenWidth > 1200) {
        finalCrossAxisCount = 5;
      } else if (screenWidth > 900) {
        finalCrossAxisCount = 4;
      } else if (screenWidth > 600) {
        finalCrossAxisCount = 3;
      }
    }

    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: finalCrossAxisCount,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
