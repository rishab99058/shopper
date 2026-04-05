import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/sizes.dart';

class AppSectionHeading extends StatelessWidget {
  const AppSectionHeading({
    super.key,
    required this.title1,
    required this.title2,
    this.onPressed,
  });

  final String title1;
  final String title2;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1, style: Theme.of(context).textTheme.headlineSmall),

          TextButton(
            onPressed: onPressed,
            child: Text(
              title2,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
