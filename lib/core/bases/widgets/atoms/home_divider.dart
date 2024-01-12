import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/e_colors.dart';

class HomeDivider extends StatelessWidget {
  const HomeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: EColors.orangeSecondary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 12,
      width: context.width / 6,
    );
  }
}
