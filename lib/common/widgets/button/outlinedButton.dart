import 'package:flutter/material.dart';
import 'package:shopper/utils/helpers/deviceHelpers.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
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
      child: OutlinedButton(onPressed: onPressed, child: child),
    );
  }
}
