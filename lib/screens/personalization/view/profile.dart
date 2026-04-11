import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/button/outlinedButton.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/common/widgets/images/circularImage.dart';
import 'package:shopper/screens/personalization/controller/profileController.dart';
import 'package:shopper/screens/personalization/controller/addressController.dart';
import 'package:shopper/screens/personalization/view/userAddresses.dart';
import 'package:shopper/screens/personalization/view/editProfile.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Profilecontroller());
    final addressController = Get.put(AddressController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const SizedBox(height: 230),

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
                onPressed: () => Get.to(() => const Editprofile()),
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

            const AppSectionHeading(title1: "Profile Information", title2: ""),

            Obx(
              () => ListTile(
                leading: const Icon(Iconsax.location),
                trailing: IconButton(
                  onPressed: () => Get.to(() => const UserAddressesScreen()),
                  icon: const Icon(Iconsax.edit),
                ),
                title: Text(
                  "Address",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                subtitle: Text(
                  addressController.addresses.isEmpty
                      ? "Set your address"
                      : addressController.addresses.last.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
              child: Text("Logout", style: TextStyle(color: AppColors.warning)),
              onPressed: controller.logout,
            ),
          ],
        ),
      ),
    );
  }
}
