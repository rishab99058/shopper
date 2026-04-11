import 'package:shopper/models/address/addressModel.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/screens/personalization/controller/addressController.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/validation/validator.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key, this.address});

  final AddressModel? address;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    // Load address data if in edit mode
    if (address != null) {
      controller.initEditAddress(address!);
    } else {
      controller.resetFormFields();
    }

    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address == null ? "Add New Address" : "Update Your Address",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                address == null
                    ? "Use the form below to add a new address"
                    : "Make changes to your saved address below",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Form(
                key: controller.addressFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.name,
                      validator: (value) =>
                          Validator.validateEmptyText(value, 'Full Name'),
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      controller: controller.phoneNumber,
                      validator: (value) =>
                          Validator.validatePhoneNumber(value),
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: Icon(Iconsax.mobile),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.street,
                            validator: (value) =>
                                Validator.validateEmptyText(value, 'Street'),
                            decoration: const InputDecoration(
                              labelText: "Street",
                              prefixIcon: Icon(Iconsax.building),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Expanded(
                          child: TextFormField(
                            controller: controller.postalCode,
                            validator: (value) => Validator.validateEmptyText(
                              value,
                              'Postal Code',
                            ),
                            decoration: const InputDecoration(
                              labelText: "Postal Code",
                              prefixIcon: Icon(Iconsax.code),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.city,
                            validator: (value) =>
                                Validator.validateEmptyText(value, 'City'),
                            decoration: const InputDecoration(
                              labelText: "City",
                              prefixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Expanded(
                          child: TextFormField(
                            controller: controller.state,
                            validator: (value) =>
                                Validator.validateEmptyText(value, 'State'),
                            decoration: const InputDecoration(
                              labelText: "State",
                              prefixIcon: Icon(Iconsax.location),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      controller: controller.country,
                      validator: (value) =>
                          Validator.validateEmptyText(value, 'Country'),
                      decoration: const InputDecoration(
                        labelText: "Country",
                        prefixIcon: Icon(Iconsax.global),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    AppElevatedButton(
                      child: Text(
                        address == null ? "Save Address" : "Update Address",
                      ),
                      onPressed: () =>
                          controller.saveAddress(existingAddress: address),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
