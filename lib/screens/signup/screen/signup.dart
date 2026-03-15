import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/common/widgets/button/elevatedButton.dart';
import 'package:shopper/screens/signup/controller/signupController.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';
import 'package:shopper/screens/signup/model/termsAndConditions.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';
import 'package:shopper/common/widgets/divider/appDivider.dart';
import 'package:shopper/common/widgets/button/circularButton.dart';
import 'package:shopper/utils/constants/images.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                AppTexts.signUpSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: AppTexts.firstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: AppTexts.lastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: AppTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    Obx(
                      () => TextFormField(
                        obscureText: controller.hidePassword.value,
                        decoration: InputDecoration(
                          labelText: AppTexts.password,
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.toggleHidePassword(),
                            icon: Icon(
                              controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: AppTexts.confirmPassword,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// Terms & Conditions Checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Obx(
                            () => Checkbox(
                              value: controller.privacyPolicy.value,
                              onChanged: (value) =>
                                  controller.togglePrivacyPolicy(),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${AppTexts.iAcceptTo} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: AppTexts.privacyPolicy,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => showTermsModal(
                                      context,
                                      AppTexts.privacyPolicy,
                                      AppTexts.privacyPolicyContent,
                                    ),
                                ),
                                TextSpan(
                                  text: ' ${AppTexts.and} ',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: AppTexts.termsOfUse,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => showTermsModal(
                                      context,
                                      AppTexts.termsOfUse,
                                      AppTexts.termsOfUseContent,
                                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spaceBtwSections),

                    /// Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: AppElevatedButton(
                        onPressed: () {},
                        child: const Text(AppTexts.createAccount),
                      ),
                    ),

                    const SizedBox(height: AppSizes.spaceBtwItems),
                    AppDivider(dark: dark, text: AppTexts.orSignInWith),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
