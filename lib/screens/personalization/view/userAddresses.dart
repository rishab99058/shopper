import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/list_tiles/singleAddress.dart';
import 'package:shopper/screens/personalization/controller/addressController.dart';
import 'package:shopper/screens/personalization/view/addAddress.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: AppBar(
        title: Text('My Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.addresses.length,
              itemBuilder: (_, index) {
                final address = controller.addresses[index];
                return SingleAddress(
                  address: address,
                  onTap: () => controller.selectAddress(address),
                  onEdit: () => Get.to(() => AddAddress(address: address)),
                  onDelete: () => controller.deleteAddress(address.id),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.to(() => const AddAddress()),
        child: const Icon(Iconsax.add, color: AppColors.white),
      ),
    );
  }
}
