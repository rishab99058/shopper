import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/screens/verifyEmail/view/verifySuccessScreen.dart';
import 'package:shopper/utils/popups/appSnackBar.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendVerificationEmail();
    sendTimerForAutoRedirect();
    super.onInit();
  }

  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      AppSnackBar.successSnackBar(
        message: 'Email Verification Sent',
        title: 'Success',
      );
    } catch (e) {
      AppSnackBar.errorSnackBar(message: e.toString(), title: 'Error');
    }
  }

  void sendTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => VerifySuccessScreen());
      }
    });
  }
}
