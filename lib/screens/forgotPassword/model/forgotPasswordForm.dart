import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/screens/login/screen/login.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          SizedBox(height: AppSizes.spaceBtwSections),
          AppElevatedButton(onPressed: () {}, child: Text(AppTexts.submit)),
          SizedBox(height: AppSizes.spaceBtwItems),
          TextButton(
            onPressed: () => Get.to(() => LoginScreen()),
            child: Text(
              AppTexts.backToLogin,
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
