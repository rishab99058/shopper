import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/button/outlinedButton.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/common/widgets/images/circularImage.dart';
import 'package:shopper/screens/personalization/controller/profileController.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Profilecontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: 230),

                HomeHeaderContainer(
                  size: 170, // Match the height
                  color: AppColors.primaryDark,
                  child: Container(),
                ),

                Positioned(
                  top: 120,
                  left: AppDeviceHelpers.getScreenWidth(context) * 0.5 - 50,
                  child: AppCircularImage(
                    imageUrl:
                        "https://res.cloudinary.com/dws1oujlk/image/upload/v1775893161/users_wk0zmo.png",
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                    showBorder: true,
                    borderColor: AppColors.primaryDark,
                    borderWidth: 4,
                    isNetworkImage: true,
                  ),
                ),
              ],
            ),

            // User Profile Name and Email
            ListTile(
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.edit),
              ),
              title: Text(
                "Saharsh Kumar Shrivastav",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                "srivastavayushbth@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            AppSectionHeading(title1: "Profile Information", title2: ""),

            ListTile(
              leading: Icon(Iconsax.location),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.edit),
              ),
              title: Text(
                "Address",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                "Set your address",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Iconsax.shopping_cart),
              title: Text(
                "My Cart",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                "View your cart items",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            ListTile(
              onTap: () {},
              leading: Icon(Iconsax.bag_tick),
              title: Text(
                "My Orders",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              subtitle: Text(
                "View your orders",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),

            AppOutlinedButton(
              child: Text("Logout"),
              onPressed: controller.logout,
            ),
          ],
        ),
      ),
    );
  }
}
