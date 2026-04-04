import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: AppDeviceHelpers.getScreenWidth(context) * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dark ? AppColors.dark : AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: Row(
        children: [
          Icon(
            Iconsax.search_normal,
            color: dark ? AppColors.grey : AppColors.darkGrey,
          ),
          const SizedBox(width: AppSizes.spaceBtwItems),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppTexts.searchInStore,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
