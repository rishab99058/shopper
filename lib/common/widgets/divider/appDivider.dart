import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, required this.dark, required this.text});

  final bool dark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            color: dark ? AppColors.white : AppColors.darkGrey,
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            color: dark ? AppColors.white : AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
