import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/appSectionHeading/appSectionHeading.dart';
import 'package:shopper/common/widgets/cards/brandShowcaseCard.dart';
import 'package:shopper/common/widgets/header/homeHeaderContainer.dart';
import 'package:shopper/common/widgets/searchBar/searchBar.dart';
import 'package:shopper/screens/homeScreen/model/customTab.dart';
import 'package:shopper/screens/storeScreen/model/brandList.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AppDeviceHelpers.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.defaultSpace),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSizes.spaceBtwSections),
                      AppSectionHeading(
                        title1: "Brands",
                        title2: "View All",
                        onPressed: () {},
                      ),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                      BrandList(dark: dark),
                      const SizedBox(height: AppSizes.spaceBtwItems),
                    ],
                  ),
                ),
              ),
              // Persistent TabBar
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Sports"),
                    Tab(text: "Furniture"),
                    Tab(text: "Electronics"),
                    Tab(text: "Clothes"),
                    Tab(text: "Shoes"),
                    Tab(text: "Accessories"),
                  ],
                  indicatorColor: AppColors.primary,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: List.generate(6, (index) {
              return ListView.builder(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                itemCount: 4,
                itemBuilder: (_, index) {
                  return BrandShowcaseCard(
                    dark: dark,
                    images: const [
                      "https://res.cloudinary.com/dws1oujlk/image/upload/v1775409442/product_67_3_uvoqjr.png",
                      "https://res.cloudinary.com/dws1oujlk/image/upload/v1775409443/product_68_waql5i.png",
                      "https://res.cloudinary.com/dws1oujlk/image/upload/v1775409441/product_66_fabe44.png",
                    ],
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
