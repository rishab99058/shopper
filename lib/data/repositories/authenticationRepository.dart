import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopper/screens/onboarding/screen/onBoarding.dart';
import 'package:shopper/screens/login/screen/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final storage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    storage.writeIfNull("isFirstTime", true);

    storage.read("isFirstTime") != false
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const LoginScreen());
  }
}
