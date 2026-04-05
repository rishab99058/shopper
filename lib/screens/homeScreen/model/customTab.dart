import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/common/widgets/appBar/appBar.dart';
import 'package:shopper/common/widgets/products/cart/cartCounterIcon.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.subTitle});

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return ShopperAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: AppColors.grey),
          ),
          Text(
            subTitle ?? "",
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
