import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/screens/homeScreen/view/home.dart';
import 'package:shopper/screens/storeScreen/view/storeScreen.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark = AppDeviceHelpers.isDarkMode(context);

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            // Use resolveWith to handle different selection states
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                );
              }
              return TextStyle(color: dark ? AppColors.white : AppColors.black);
            }),
          ),
          child: NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            elevation: 0,
            backgroundColor: dark ? AppColors.black : AppColors.white,
            indicatorColor: AppColors.primary.withAlpha(100),
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                  color: dark ? AppColors.white : AppColors.black,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.shop,
                  color: dark ? AppColors.white : AppColors.black,
                ),
                label: 'Shop',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.heart,
                  color: dark ? AppColors.white : AppColors.black,
                ),
                label: 'Wishlist',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                  color: dark ? AppColors.white : AppColors.black,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];
}
