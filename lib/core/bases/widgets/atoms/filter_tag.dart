import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  const FilterTag(
      {super.key,
      required this.name,
      this.icon,
      this.isInverted = false,
      this.isActive = false,
      this.onTap,
      this.color = EColors.orangePrimary});

  final String name;
  final IconData? icon;
  final bool isInverted;
  final bool isActive;
  final Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        decoration: BoxDecoration(
          color: isActive
              ? color
              : isInverted
                  ? EColors.white
                  : EColors.greyTag,
          borderRadius: BorderRadius.circular(16),
          border: isInverted ? Border.all(color: EColors.greyPrimary) : null,
        ),
        height: 32,
        child: Row(
          children: [
            Text(name,
                style: isActive
                    ? EColors.white.w400.s12
                    : EColors.greyPrimary.w400.s12),
            Offstage(
              offstage: icon == null,
              child: Icon(icon,
                  color: isActive ? EColors.white : EColors.greyPrimary,
                  size: 14),
            )
          ],
        ),
      ),
    );
  }
}
