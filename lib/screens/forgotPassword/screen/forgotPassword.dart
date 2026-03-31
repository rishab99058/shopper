import 'package:flutter/material.dart';
import 'package:shopper/screens/forgotPassword/model/forgotPasswordForm.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/constants/text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwItems),
              Text(
                AppTexts.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: AppSizes.spaceBtwSections),
              ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
