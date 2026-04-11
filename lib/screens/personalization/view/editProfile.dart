import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/button/outlinedButton.dart';
import 'package:shopper/common/widgets/images/circularImage.dart';
import 'package:shopper/screens/personalization/controller/profileController.dart';
import 'package:shopper/screens/personalization/model/usereDetails.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Get.put to guarantee controller initialization
    final controller = Get.put(Profilecontroller());
    bool isDark = AppDeviceHelpers.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Outer container for a soft glowing shadow effect
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryDark.withValues(alpha: 0.2),
                          blurRadius: 24,
                          spreadRadius: 4,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Obx(() {
                      final imageUrl = controller.profileImageUrl.value;
                      final isFile = controller.isProfileImageFile.value;

                      return AppCircularImage(
                        imageUrl: imageUrl,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        showBorder: true,
                        borderColor: AppColors.primaryDark,
                        borderWidth: 3,
                        isFileImage: isFile,
                        isNetworkImage: !isFile,
                      );
                    }),
                  ),

                  // Floating Edit Badge
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => controller.pickProfileImage(),
                      child: Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: AppColors.primaryDark,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppDeviceHelpers.isDarkMode(context)
                                ? const Color(0xFF1F2937)
                                : Colors.white,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Iconsax.camera,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: AppDeviceHelpers.getScreenWidth(context) * 0.9,
              child: Divider(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.5),
              ),
            ),
            AppSectionHeading(title1: "Account Setting", title2: ""),

            UserDetails(
              title: "Name",
              value: "Saharsh Kumar Srivastava",
              onPressed: () {},
              icon: Iconsax.edit,
            ),

            UserDetails(
              title: "Username",
              value: "saharsh_kumar_srivastava",
              onPressed: () {},
              icon: Iconsax.edit,
            ),

            const SizedBox(height: AppSizes.md),
            SizedBox(
              width: AppDeviceHelpers.getScreenWidth(context) * 0.9,
              child: Divider(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.5),
              ),
            ),

            AppSectionHeading(title1: "Profile Information", title2: ""),
            const SizedBox(height: AppSizes.sm),

            UserDetails(
              title: "UserId",
              value: "User12345",
              onPressed: () {},
              icon: Iconsax.copy,
            ),

            UserDetails(
              title: "Email",
              value: "vermau2k01@gmail.com",
              onPressed: () {},
              icon: Iconsax.edit,
            ),

            UserDetails(
              title: "Phone Number",
              value: "+91 1234567890",
              onPressed: () {},
              icon: Iconsax.edit,
            ),

            UserDetails(
              title: "Role",
              value: "Customer",
              onPressed: () {},
              icon: Iconsax.copy,
            ),

            SizedBox(
              width: AppDeviceHelpers.getScreenWidth(context) * 0.9,
              child: Divider(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.5)
                    : Colors.black.withValues(alpha: 0.5),
              ),
            ),

            const SizedBox(height: AppSizes.md),

            AppOutlinedButton(
              child: Text(
                "Delete Account",
                style: TextStyle(color: AppColors.error),
              ),
              onPressed: () => controller.deleteAccount(),
            ),
          ],
        ),
      ),
    );
  }
}
