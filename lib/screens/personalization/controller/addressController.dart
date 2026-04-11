import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper/models/address/addressModel.dart';
import 'package:shopper/utils/constants/keys.dart';
import 'package:shopper/utils/popups/appDialog.dart';
import 'package:shopper/utils/popups/appSnackBar.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final RxList<AddressModel> addresses = <AddressModel>[].obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final deviceStorage = GetStorage();

  // Controllers for form fields
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    loadAddresses();
  }

  /// Load addresses from local storage
  void loadAddresses() {
    try {
      final storedAddresses = deviceStorage.read(AppKeys.userAddresses);
      if (storedAddresses != null) {
        final List<dynamic> decodedAddresses = jsonDecode(storedAddresses);
        final list = decodedAddresses
            .map((e) => AddressModel.fromJson(e))
            .toList();
        addresses.assignAll(list);

        // Set selected address if available
        final selected = list.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty(),
        );
        if (selected.id.isNotEmpty) {
          selectedAddress.value = selected;
        }
      }
    } catch (e) {
      AppSnackBar.errorSnackBar(
        title: 'Error',
        message: 'Failed to load addresses: $e',
      );
    }
  }

  /// Select an address
  Future<void> selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Clear previous selection
      if (selectedAddress.value.id.isNotEmpty) {
        final index = addresses.indexWhere(
          (element) => element.id == selectedAddress.value.id,
        );
        if (index != -1) {
          addresses[index].selectedAddress = false;
        }
      }

      // Set new selection
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Update in list
      final index = addresses.indexWhere(
        (element) => element.id == newSelectedAddress.id,
      );
      if (index != -1) {
        addresses[index] = newSelectedAddress;
      }

      saveToStorage();
      Get.back();
    } catch (e) {
      AppSnackBar.errorSnackBar(
        title: 'Error',
        message: 'Failed to select address',
      );
    }
  }

  /// Init form for editing
  void initEditAddress(AddressModel address) {
    name.text = address.name;
    phoneNumber.text = address.phoneNumber;
    street.text = address.street;
    postalCode.text = address.postalCode;
    city.text = address.city;
    state.text = address.state;
    country.text = address.country;
  }

  /// Save or Update address
  Future<void> saveAddress({AddressModel? existingAddress}) async {
    try {
      // Form Validation
      if (!addressFormKey.currentState!.validate()) return;

      if (existingAddress != null) {
        // Update Existing
        final updatedAddress = AddressModel(
          id: existingAddress.id,
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          postalCode: postalCode.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          dateTime: existingAddress.dateTime,
          selectedAddress: existingAddress.selectedAddress,
        );

        final index = addresses.indexWhere(
          (element) => element.id == existingAddress.id,
        );
        if (index != -1) {
          addresses[index] = updatedAddress;
          if (updatedAddress.selectedAddress)
            selectedAddress.value = updatedAddress;
        }
      } else {
        // Add New
        final newAddress = AddressModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          postalCode: postalCode.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          country: country.text.trim(),
          dateTime: DateTime.now(),
          selectedAddress: addresses.isEmpty, // Select if first address
        );

        addresses.add(newAddress);
        if (newAddress.selectedAddress) selectedAddress.value = newAddress;
      }

      // Save to local storage
      saveToStorage();

      // Show success message
      AppSnackBar.successSnackBar(
        title: 'Success',
        message: 'Address saved successfully!',
      );
      Get.back();
    } catch (e) {
      AppSnackBar.errorSnackBar(
        title: 'Error',
        message: 'Something went wrong: $e',
      );
    }
  }

  /// Persist addresses to disk
  void saveToStorage() {
    final String encodedAddresses = jsonEncode(
      addresses.map((e) => e.toJson()).toList(),
    );
    deviceStorage.write(AppKeys.userAddresses, encodedAddresses);
  }

  /// Delete an address
  void deleteAddress(String id) {
    try {
      AppDialog.showWarning(
        title: 'Delete Address',
        description: 'Are you sure you want to delete this address?',
        primaryButtonText: 'Delete',
        onPrimaryPressed: () {
          addresses.removeWhere((element) => element.id == id);
          saveToStorage();
          AppSnackBar.successSnackBar(
            title: 'Success',
            message: 'Address deleted successfully!',
          );
          Get.back();
        },
        secondaryButtonText: 'Cancel',
        onSecondaryPressed: () {
          Get.back();
        },
      );
    } catch (e) {
      AppSnackBar.errorSnackBar(
        title: 'Error',
        message: 'Failed to delete address',
      );
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
