import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/services/format.dart';
import '../../../../core/themes/e_colors.dart';
import '../../../../data/models/order/menu_order_model.dart';

// Menu Order Card for Global Order Page
class MenuOrderCard extends StatelessWidget {
  const MenuOrderCard({
    super.key,
    required this.menu,
  });

  final MenuOrderModel menu;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 99.0 / 111.0,
                  child: Image.network(
                    menu.menu_photo_url,
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
                    menu.name,
                    style: EColors.black.w700.s14,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.thumb_up_off_alt_outlined,
                        color: Colors.red,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text('Recommended', style: EColors.greyPrimary.w400.s12),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatPrice(menu.price),
                    style: EColors.black.w400.s12,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Text(
                  menu.quantity.toString(),
                  style: EColors.black.w400.s14,
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 20,
          color: EColors.greyPrimary,
        ),
      ],
    );
  }
}
