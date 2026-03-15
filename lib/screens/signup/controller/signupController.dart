import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final privacyPolicy = false.obs;
  final hidePassword = true.obs;

  void togglePrivacyPolicy() {
    privacyPolicy.value = !privacyPolicy.value;
  }

  void toggleHidePassword() {
    hidePassword.value = !hidePassword.value;
  }
}
