import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/cards/brandCard.dart';
import 'package:shopper/utils/constants/sizes.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          80, // Constrain the horizontal list to the exact height of BrandCard
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            // Give margin to items to prevent them squishing up against each other
            padding: const EdgeInsets.only(right: AppSizes.spaceBtwItems),
            child: BrandCard(
              dark: dark,
              brandName: "Nike",
              brandImage:
                  "https://res.cloudinary.com/dws1oujlk/image/upload/v1775391810/nike_x9nyku.png",
              productCount: "100",
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
