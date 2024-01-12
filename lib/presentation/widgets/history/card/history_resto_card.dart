import 'package:e_menu_app/core/bases/widgets/atoms/separator.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/data/models/history/history_model.dart';

import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/widgets/history/history_order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/services/distance.dart';
import '../../../../data/models/restaurant/restaurant_model.dart';
import '../../../controllers/restaurant_controller.dart';

// Resto Card in History Page
class HistoryRestoCard extends StatelessWidget {
  const HistoryRestoCard({
    super.key,
    required this.history,
  });

  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    final MainWrapperController controller = Get.find();
    final RestaurantController rController = Get.find();
    final RestaurantModel restaurant =
        rController.getRestaurantById(history.restaurant_id)!;
    return InkWell(
      onTap: () => Get.to(
        () => HistoryOrderPage(
          history: history,
        ),
      ),
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
                  Text(
                    DateFormat('dd MMM yyyy', 'id_ID')
                        .format(DateTime.parse(history.created_at).toLocal()),
                    style: EColors.black.w400.s12,
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
