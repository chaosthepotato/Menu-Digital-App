import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/format.dart';
import 'package:e_menu_app/data/models/history/history_model.dart';
import 'package:e_menu_app/presentation/widgets/order/card/menu_order_card.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/e_colors.dart';

class HistoryOrderPage extends StatelessWidget {
  const HistoryOrderPage({super.key, required this.history});

  final HistoryModel history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                itemCount: history.menu_ordered.length,
                itemBuilder: (context, index) {
                  return MenuOrderCard(menu: history.menu_ordered[index]);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: EColors.black.w700.s14,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price'),
                      Text(formatPrice(history.total_price)),
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
                      Text(formatPrice(history.total_price + 7500)),
                    ],
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
