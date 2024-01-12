import 'package:flutter/material.dart';

import '../../../themes/e_colors.dart';

class InvalidImage extends StatelessWidget {
  const InvalidImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.image_not_supported,
        color: EColors.greyPrimary,
      ),
    );
  }
}
