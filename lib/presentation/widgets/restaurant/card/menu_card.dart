import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/services/format.dart';
import '../../../../core/themes/e_colors.dart';
import '../../../../data/models/menu/menu_model.dart';

// Menu Card for Restaurant Page
class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.menu,
    required this.index,
    this.tableId,
    this.isOrderPage = false,
  });

  final MenuModel menu;
  final int index;
  final int? tableId;
  final bool isOrderPage;

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find();
    return Obx(
      () => Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text('Recommended',
                            style: EColors.greyPrimary.w400.s12),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(menu.description,
                        style: EColors.black.w400.s12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
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
                child: Visibility(
                  // TODO(Adiet): CHANGE TO != (DONE)
                  visible: (tableId != null) || isOrderPage,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: !isOrderPage,
                          child: InkWell(
                            onTap: () {
                              // remove total order and total price
                              if (controller.order.containsKey(menu)) {
                                controller.setTotalPrice(controller.totalPrice -
                                    (controller.order[menu]! * menu.price));
                                controller.order.remove(menu);
                              }
                              // else add total order and total price
                              else {
                                controller.order[menu] = 1;
                                controller.setTotalPrice(
                                    controller.totalPrice + menu.price);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: controller.order.containsKey(menu)
                                      ? EColors.orangePrimary
                                      : EColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(color: EColors.orangePrimary)),
                              child: Center(
                                  child: Text(
                                'Order',
                                style: controller.order.containsKey(menu)
                                    ? EColors.white.w700.s14
                                    : EColors.orangePrimary.w700.s14,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // plus minus button for count
                        Visibility(
                          visible:
                              controller.order.containsKey(menu) || isOrderPage,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (controller.order.containsKey(menu)) {
                                    if (controller.order[menu]! > 1) {
                                      controller.order[menu] =
                                          controller.order[menu]! - 1;
                                    } else {
                                      controller.order.remove(menu);
                                    }
                                    controller.setTotalPrice(
                                        controller.totalPrice - menu.price);
                                  }
                                  if (isOrderPage &&
                                      controller.totalPrice == 0) {
                                    Get.back();
                                  }
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: EColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: EColors.orangePrimary,
                                        width: 2,
                                      )),
                                  child: Center(
                                      child: Text(
                                    '-',
                                    style: EColors.orangePrimary.w900.s14,
                                  )),
                                ),
                              ),
                              Text(
                                controller.order.containsKey(menu)
                                    ? controller.order[menu].toString()
                                    : '0',
                                style: EColors.black.w500.s14,
                              ),
                              InkWell(
                                onTap: () {
                                  if (controller.order.containsKey(menu)) {
                                    controller.order[menu] =
                                        controller.order[menu]! + 1;
                                  } else {
                                    controller.order[menu] = 1;
                                  }
                                  controller.setTotalPrice(
                                      controller.totalPrice + menu.price);
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      color: EColors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: EColors.orangePrimary,
                                        width: 2,
                                      )),
                                  child: Center(
                                      child: Text(
                                    '+',
                                    style: EColors.orangePrimary.w900.s14,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
