import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';

class EButton extends StatelessWidget {
  const EButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EColors.orangeSecondary,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
