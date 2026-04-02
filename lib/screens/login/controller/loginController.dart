import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/navigationMenu.dart';
import 'package:shopper/utils/helpers/networkHelpers.dart';
import 'package:shopper/utils/popups/appSnackBar.dart';
import 'package:shopper/utils/popups/fullScreenLoader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  final localStorage = GetStorage();

  final loginFormKey = GlobalKey<FormState>();

  final authenticationRepository = Get.put(AuthenticationRepository());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('email') ?? '';
    password.text = localStorage.read('password') ?? '';
  }

  void togglePassword() => hidePassword.value = !hidePassword.value;
  void toggleRememberMe() {
    rememberMe.toggle();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      AppFullscreenloader.openLoadingDialog("Logging in...");
      bool isConnected = await Get.put(NetworkManager()).isConnected();
      if (!isConnected) {
        AppFullscreenloader.stopLoading();
        AppSnackBar.warningSnackBar(
          message: 'Please check your internet connection',
          title: 'No Internet',
        );
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        AppFullscreenloader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('email', email.text.trim());
        localStorage.write('password', password.text.trim());
      }

      // login using usser and password
      await authenticationRepository.emailAndPasswordSignIn(
        email.text.trim(),
        password.text.trim(),
      );

      AppFullscreenloader.stopLoading();
      AppSnackBar.successSnackBar(
        message: 'Login successful',
        title: 'Success',
      );

      // Redirect to home screen
      authenticationRepository.screenRedirect();
    } catch (e) {
      AppFullscreenloader.stopLoading();
      AppSnackBar.errorSnackBar(message: e.toString(), title: 'Error');
    }
  }
}
