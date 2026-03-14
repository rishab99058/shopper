import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({super.key, required this.dark, required this.child});

  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: dark ? AppColors.white : AppColors.darkGrey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }
}
