import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopper/data/repositories/user/userRepository.dart';
import 'package:shopper/models/authentication/userModel.dart';
import 'package:shopper/screens/verifyEmail/view/verifyEmail.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/utils/helpers/networkHelpers.dart';
import 'package:shopper/utils/popups/appSnackBar.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/utils/popups/fullScreenLoader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final authRepo = Get.put(AuthenticationRepository());
  final signUpFormKey = GlobalKey<FormState>();
  final privacyPolicy = false.obs;
  final hidePassword = true.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  void togglePrivacyPolicy() {
    privacyPolicy.value = !privacyPolicy.value;
  }

  void toggleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }

  Future<void> registerUser() async {
    try {
      AppFullscreenloader.openLoadingDialog('Creating Account...');
      bool isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        AppFullscreenloader.stopLoading();
        AppSnackBar.warningSnackBar(
          message: 'Please check your internet connection',
          title: 'No Internet',
        );
        return;
      }
      if (!signUpFormKey.currentState!.validate()) {
        AppFullscreenloader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {
        AppFullscreenloader.stopLoading();
        AppSnackBar.warningSnackBar(
          message: 'Please agree to the terms and conditions',
          title: 'Terms and Conditions',
        );
      }
      // AppFullscreenloader.openLoadingDialog('Creating Account...');
      final userCredential = await authRepo.registerUser(
        email.text.trim(),
        password.text.trim(),
      );

      // Create User Model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: (firstName.text.trim() + lastName.text.trim()).toLowerCase(),
        email: email.text.trim(),
        phone: phoneNumber.text.trim(),
        profilePicture: '',
        role: AppTexts.roleUser,
      );

      final UserRepository userRepo = Get.put(UserRepository());
      await userRepo.saveUserRecord(userModel);

      AppFullscreenloader.stopLoading();

      AppSnackBar.successSnackBar(
        message: 'User registered successfully',
        title: 'Success',
      );

      // AppFullscreenloader.stopLoading();

      //   redirect to verify email screen
      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      AppFullscreenloader.stopLoading();
      print('SignUpController Error: $e');
      AppSnackBar.errorSnackBar(message: e.toString(), title: 'Error');
    }
  }
}
