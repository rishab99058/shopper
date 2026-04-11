import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopper/data/repositories/authenticationRepository.dart';
import 'package:shopper/utils/popups/appDialog.dart';

class Profilecontroller extends GetxController {
  static Profilecontroller get instance => Get.find();

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository.instance;

  final RxString profileImageUrl =
      "https://res.cloudinary.com/dws1oujlk/image/upload/v1775893161/users_wk0zmo.png"
          .obs;
  final RxBool isProfileImageFile = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickProfileImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (image != null) {
        profileImageUrl.value = image.path;
        isProfileImageFile.value = true;
        // Optional: Trigger your API upload here
      }
    } catch (e) {
      AppDialog.showError(
        title: "Error",
        description: "Failed to pick image: $e",
      );
    }
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

  void deleteAccount() {
    try {
      AppDialog.showWarning(
        title: "Delete Account",
        description:
            "Are you sure you want to permanently delete your account? This action cannot be undone.",
        primaryButtonText: "Delete",
        onPrimaryPressed: () async {
          Get.back();
          try {
            await _authenticationRepository.deleteAccount();
          } catch (e) {
            AppDialog.showError(
              title: "Account Deletion Failed",
              description: e.toString(),
            );
          }
        },
        secondaryButtonText: "Cancel",
        onSecondaryPressed: () {
          Get.back();
        },
      );
    } catch (e) {
      AppDialog.showError(title: "Error", description: "Something went wrong.");
    }
  }
}
