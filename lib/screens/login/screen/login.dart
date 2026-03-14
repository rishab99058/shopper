import 'package:flutter/material.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/common/widgets/button/outlinedButton.dart';
import 'package:shopper/screens/login/controller/loginController.dart';
import 'package:get/get.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/common/widgets/divider/appDivider.dart';
import 'package:shopper/common/widgets/button/circularButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.defaultSpace,
          horizontal: AppSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTexts.loginTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSizes.sm),
            Text(
              AppTexts.loginSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: AppSizes.spaceBtwSections),

            Form(
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
                      obscureText:
                          controller.hidePassword.value, // Bind to observable
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
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            AppTexts.rememberMe,
                            style: Theme.of(context).textTheme.bodyMedium,
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
                  AppElevatedButton(
                    onPressed: () {},
                    child: Text(AppTexts.login),
                  ),

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
                            AppImages.googleIcon,
                            height: AppSizes.md,
                            width: AppSizes.md,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
