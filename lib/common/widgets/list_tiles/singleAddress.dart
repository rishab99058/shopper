import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:shopper/models/address/addressModel.dart';
import 'package:shopper/screens/personalization/controller/addressController.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final AddressModel address;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final isDark = AppDeviceHelpers.isDarkMode(context);

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final isSelected = selectedAddressId == address.id;

      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSizes.md),
          margin: const EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected 
                ? AppColors.primaryDark.withValues(alpha: 0.1) 
                : Colors.transparent,
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : isDark
                      ? const Color(0xFF27272A)
                      : const Color(0xFFE4E4E7),
              width: 1.5,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Icon(
                  isSelected ? Iconsax.tick_circle5 : null,
                  color: isSelected ? AppColors.primary : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: onEdit,
                        icon: const Icon(Iconsax.edit, size: 20),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      IconButton(
                        onPressed: onDelete,
                        icon: Icon(Iconsax.trash, size: 20, color: AppColors.error),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sm / 2),
                  Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSizes.sm / 2),
                  Text(
                    address.toString(),
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
