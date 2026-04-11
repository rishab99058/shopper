import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopper/utils/constants/sizes.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.icon,
  });

  final String title;
  final String value;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.lg, right: AppSizes.lg),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(title, style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            flex: 5,
            child: Text(value, style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            flex: 1,
            child: IconButton(onPressed: onPressed, icon: Icon(icon)),
          ),
        ],
      ),
    );
  }
}
