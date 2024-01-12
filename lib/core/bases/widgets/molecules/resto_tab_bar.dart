import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Tab Bar for Restaurant Page
class RestoTabBar extends StatelessWidget {
  const RestoTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantController controller = Get.find();

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: EColors.greyTag,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            RestoTab(
              title: 'Menu',
              isActive: controller.tabIndex == 0,
              onTap: () => controller.setTabIndex(0),
            ),
            RestoTab(
              title: 'About Us',
              isActive: controller.tabIndex == 1,
              onTap: () => controller.setTabIndex(1),
            ),
            RestoTab(
              title: 'Reviews',
              isActive: controller.tabIndex == 2,
              onTap: () => controller.setTabIndex(2),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab for Restaurant Page
class RestoTab extends StatelessWidget {
  const RestoTab({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  final String title;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? EColors.orangeSecondary : EColors.greyTag,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Center(
              child: Text(
            title,
            style: isActive ? EColors.white.w400 : EColors.black.w400,
          )),
        ),
      ),
    );
  }
}
