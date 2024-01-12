import 'package:e_menu_app/presentation/widgets/order/global_order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/e_colors.dart';

class GlobalOderButton extends StatelessWidget {
  const GlobalOderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.to(() => const GlobalOrderPage()),
      shape: const CircleBorder(),
      elevation: 0,
      backgroundColor: EColors.orangeSecondary,
      child: const Icon(Icons.restaurant),
    );
  }
}
