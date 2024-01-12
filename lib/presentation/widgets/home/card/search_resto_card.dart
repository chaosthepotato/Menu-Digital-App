import 'package:e_menu_app/core/bases/widgets/atoms/separator.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/services/distance.dart';
import '../../../../data/models/restaurant/restaurant_model.dart';
import '../../../controllers/main_wrapper_controller.dart';
import '../../restaurant/restaurant_page.dart';

// Resto Card in Search Page and Category Page
class SearchRestoCard extends StatelessWidget {
  const SearchRestoCard({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final MainWrapperController controller = Get.find();

    return InkWell(
      onTap: () => Get.to(() => RestaurantPage(restaurant: restaurant)),
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 99.0 / 111.0,
                  child: Image.network(
                    restaurant.restaurant_photo_url,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const InvalidImage(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: EColors.black.w700.s16,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text('\$\$', style: EColors.black.w400.s12),
                      Text('\$\$ . ${restaurant.category}',
                          style: EColors.greyPrimary.w400.s12),
                    ],
                  ),
                  const MySeparator(),
                  Text(
                      distanceBetween(
                          controller.latitude,
                          controller.longitude,
                          double.tryParse(restaurant.address.latitude) ?? 0,
                          double.tryParse(restaurant.address.longitude) ?? 0),
                      style: EColors.black.w400.s12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
