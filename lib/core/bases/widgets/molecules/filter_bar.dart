import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../presentation/controllers/filter_controller.dart';
import '../atoms/filter_tag.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key, this.category});

  final String? category;

  @override
  Widget build(BuildContext context) {
    FilterController controller = Get.find()
      ..clear()
      ..setCategory(category ?? '');

    return Obx(
      () => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 20),
            InkWell(
              onTap: () => controller.showFilterBottomSheet(),
              child: FilterTag(
                name: 'Filter',
                icon: Icons.filter_alt,
                isActive: controller.isFiltering(),
              ),
            ),
            const SizedBox(width: 8),
            FilterTag(
              name: 'Near Me',
              onTap: () => controller
                  .setDistanceIndex(controller.distanceIndex == 1 ? 0 : 1),
              isActive: controller.distanceIndex == 1,
            ),
            const SizedBox(width: 8),
            FilterTag(
              name: 'Rating',
              icon: Icons.star,
              isActive: controller.rating != 0,
              onTap: () => controller.showFilterBottomSheet(),
            ),
            const SizedBox(width: 8),
            FilterTag(
              name: 'Pricing \$',
              isActive: controller.pricingIndex != 0,
              onTap: () => controller.showFilterBottomSheet(),
            ),
            const SizedBox(width: 8),
            FilterTag(
              name: 'Currently Open',
              isActive: controller.statusIndex == 1,
              onTap: () => controller
                  .setStatusIndex(controller.statusIndex == 1 ? 0 : 1),
            ),
          ],
        ),
      ),
    );
  }
}
