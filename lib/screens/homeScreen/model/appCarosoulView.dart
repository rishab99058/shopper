import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/images.dart';
import 'package:shopper/utils/constants/sizes.dart';

class AppCarosoulView extends StatelessWidget {
  const AppCarosoulView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          child: Image.network(AppImages.banner1),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          child: Image.network(AppImages.banner2),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          child: Image.network(AppImages.banner3),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          child: Image.network(AppImages.banner4),
        ),
      ],
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
