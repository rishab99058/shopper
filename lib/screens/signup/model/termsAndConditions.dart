import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/utils/constants/sizes.dart';

void showTermsModal(BuildContext context, String title, String content) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => Container(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.close_circle),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
