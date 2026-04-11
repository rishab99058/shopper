import 'package:get/get.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/utils/popups/appDialog.dart';

class Profilecontroller extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    try {
      AppDialog.showWarning(
        title: "Logout",
        description: "Are you sure you want to logout?",
        primaryButtonText: "Logout",
        onPrimaryPressed: () {
          _authenticationRepository.logout();
        },
        secondaryButtonText: "Cancel",
        onSecondaryPressed: () {
          Get.back();
        },
      );
    } catch (e) {}
  }
}
