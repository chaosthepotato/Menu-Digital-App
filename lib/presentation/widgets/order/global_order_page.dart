import 'package:e_menu_app/core/bases/widgets/atoms/button.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/format.dart';
import 'package:e_menu_app/presentation/widgets/order/card/menu_order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/e_colors.dart';
import '../../controllers/global_order_controller.dart';

class GlobalOrderPage extends StatelessWidget {
  const GlobalOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalOrderController controller = Get.find()..getOrders();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          foregroundColor: EColors.orangePrimary,
          centerTitle: true,
          title: Text(
            'Orders',
            style: EColors.black.w700.s24,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final order = controller.orders[index];
                    return MenuOrderCard(menu: order);
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: EColors.black.w400.s14,
                        ),
                        Obx(
                          () => Text(
                            formatPrice(controller.totalPrice),
                            style: EColors.black.w500.s14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    EButton(
                        onTap: controller.closeOrder,
                        child: Text(
                          'Close Order',
                          style: EColors.white.w700,
                        )),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
