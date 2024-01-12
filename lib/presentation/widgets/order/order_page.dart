import 'package:e_menu_app/core/bases/widgets/atoms/button.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/format.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/order_controller.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/card/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../payment/payment_page.dart';

// Order Page
class OrderPage extends StatelessWidget {
  const OrderPage({
    super.key,
    required this.restaurantId,
    required this.tableId,
  });

  final String restaurantId;
  final int tableId;

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find();
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
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    controller.order.length,
                    (index) => MenuCard(
                      menu: controller.order.keys.toList()[index],
                      index: index,
                      isOrderPage: true,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Payment Summary',
                    style: EColors.black.w700.s14,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Table Number'),
                      Text(tableId.toString()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price'),
                      Text(formatPrice(controller.totalPrice)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service and other fees'),
                      Text('7.500'),
                    ],
                  ),
                  const Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Payment'),
                      Text(formatPrice(controller.totalPrice + 7500)),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: EButton(
                      onTap: () {
                        Get.to(() => PaymentPage(
                              restaurantId: restaurantId,
                              tableId: tableId,
                            ));
                      },
                      child: Text(
                        'Place Order & Checkout',
                        style: EColors.white.w700.s14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
