import 'package:flutter/material.dart';
import 'package:shopper/utils/constants/colors.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppCircularContainer extends StatelessWidget {
  const AppCircularContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.child,
    this.top,
    this.right,
  });

  final double? top;
  final double? right;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Widget container = Container(
      width: width ?? AppDeviceHelpers.getScreenHeight(context) * 0.4,
      height: height ?? AppDeviceHelpers.getScreenHeight(context) * 0.4,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.borderSecondary.withAlpha(30),
        shape: BoxShape.circle,
      ),
      child: child,
    );

    if (top != null || right != null) {
      return Positioned(
        top: top,
        right: right,
        child: container,
      );
    }

    return container;
  }
}
