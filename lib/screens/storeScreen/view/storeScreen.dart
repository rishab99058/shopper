import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/common/widgets/searchBar/searchBar.dart';
import 'package:shopper/screens/homeScreen/model/customTab.dart';
import 'package:shopper/screens/storeScreen/model/brandList.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 180, // Expand height properly
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    const SizedBox(height: 180),
                    HomeHeaderContainer(
                      size: 180, // Match the height
                      color: AppColors.gunmetalTeal,
                      child: CustomAppBar(title: "", subTitle: "Store"),
                    ),
                    Positioned(
                      // Same position logic as HomeScreen UpperPart
                      bottom: 25,
                      left: 20,
                      right: 20,
                      child: AppSearchBar(dark: dark),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            spacing: AppSizes.sm,
            children: [
              const SizedBox(height: AppSizes.sm),
              AppSectionHeading(
                title1: "Brands",
                title2: "View All",
                onPressed: () {},
              ),

              const SizedBox(height: AppSizes.spaceBtwItems),

              BrandList(dark: dark),

              const SizedBox(height: AppSizes.spaceBtwItems),

              AppSectionHeading(
                title1: "Products",
                title2: "View All",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
