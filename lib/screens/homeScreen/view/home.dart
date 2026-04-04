import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopper/screens/homeScreen/model/appCarosoulView.dart';
import 'package:shopper/screens/homeScreen/model/upperPart.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperPart(dark: dark),
            SizedBox(height: AppSizes.spaceBtwItems),
            AppCarosoulView(),
          ],
        ),
      ),
    );
  }
}
