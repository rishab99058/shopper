import 'package:flutter/material.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDeviceHelpers.getScreenWidth(context) - 40,
      child: ElevatedButton(onPressed: onPressed, child: child),
    );
  }
}
