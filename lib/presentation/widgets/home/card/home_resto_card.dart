import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/services/distance.dart';
import '../../../../core/themes/e_colors.dart';
import '../../../controllers/filter_controller.dart';

// Resto Card in Home Page
class HomeRestoCard extends StatelessWidget {
  const HomeRestoCard({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final MainWrapperController controller = Get.find();
    Get.put(FilterController());

    return InkWell(
      onTap: () => Get.to(() => RestaurantPage(restaurant: restaurant)),
      child: Container(
        decoration: BoxDecoration(
          color: EColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        width: context.width * 0.33 * 1.1,
        height: context.width * 0.33 * 1.2,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  restaurant.restaurant_photo_url,
                  errorBuilder: (context, error, stackTrace) =>
                      const InvalidImage(),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            restaurant.name,
                            style: EColors.black.w700.s10,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.star,
                          color: EColors.orangeSecondary, size: 16),
                      Text(restaurant.rating.toPrecision(1).toString(),
                          style: EColors.black.w400.s10),
                      const SizedBox(width: 2),
                      Text('(10+)', style: EColors.greyPrimary.w400.s10),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text('\$\$', style: EColors.black.w400.s9),
                      Text('\$\$ . ${restaurant.category}',
                          style: EColors.greyPrimary.w400.s9),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Obx(
                    () => Text(
                      distanceBetween(
                          controller.latitude,
                          controller.longitude,
                          double.tryParse(restaurant.address.latitude) ?? 0,
                          double.tryParse(restaurant.address.longitude) ?? 0),
                      style: EColors.greyPrimary.w400.s9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
