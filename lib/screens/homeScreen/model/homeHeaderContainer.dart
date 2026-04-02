import 'package:flutter/material.dart';
import 'package:shopper/common/widgets/circularContainer/circularContainer.dart';
import 'package:shopper/common/widgets/custom_shapes/curved_edges/curvedEdgesWidget.dart';
import 'package:shopper/utils/constants/colors.dart';

class HomeHeaderContainer extends StatelessWidget {
  const HomeHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgesWidget(
      child: Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              /// -- Background Custom Shapes
              AppCircularContainer(
                backgroundColor: AppColors.textWhite.withAlpha(30),
                top: -150,
                right: -150,
              ),
              AppCircularContainer(
                backgroundColor: AppColors.textWhite.withAlpha(30),
                top: 100,
                right: -200,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
