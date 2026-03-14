import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/divider/appDivider.dart';
import 'package:shopper/common/widgets/button/circularButton.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/common/widgets/button/outlinedButton.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:get/get.dart';
import 'package:shopper/screens/login/controller/loginController.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.controller, required this.dark});

  final LoginController controller;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: AppTexts.email,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value, // Bind to observable
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: AppTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.togglePassword(),
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          Obx(
            () => Row(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.toggleRememberMe(),
                    ),
                    TextButton(
                      onPressed: () => controller.toggleRememberMe(),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        AppTexts.rememberMe,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppTexts.forgotPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          AppElevatedButton(onPressed: () {}, child: Text(AppTexts.login)),

          const SizedBox(height: AppSizes.spaceBtwSections),
          AppOutlinedButton(
            onPressed: () {},
            child: Text(
              AppTexts.createAccount,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          const SizedBox(height: AppSizes.spaceBtwSections),

          AppDivider(dark: dark, text: AppTexts.loginWith),

          const SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButton(
                dark: dark,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.googleIcon,
                    height: AppSizes.md,
                    width: AppSizes.md,
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),

              CircularButton(
                dark: dark,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AppImages.facebookIcon,
                    height: AppSizes.md,
                    width: AppSizes.md,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
