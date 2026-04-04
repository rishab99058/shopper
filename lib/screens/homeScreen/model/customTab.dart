import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/common/widgets/appBar/appBar.dart';
import 'package:shopper/common/widgets/products/cart/cartCounterIcon.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ShopperAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: AppColors.grey),
          ),
          Text(
            AppTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () => Get.defaultDialog(
            title: "Logout",
            middleText: "Are you sure you want to logout?",
            onConfirm: () => AuthenticationRepository.instance.logout(),
            onCancel: () => Get.back(),
            textConfirm: "Logout",
            textCancel: "Cancel",
            confirmTextColor: Colors.white,
          ),
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
