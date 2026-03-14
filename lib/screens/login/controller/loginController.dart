import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = true.obs;

  void togglePassword() => hidePassword.value = !hidePassword.value;
  void toggleRememberMe() {
    rememberMe.toggle();
    print("Remember Me: ${rememberMe.value}");
  }
}
