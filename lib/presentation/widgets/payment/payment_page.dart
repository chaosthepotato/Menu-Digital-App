import 'package:e_menu_app/core/bases/widgets/atoms/button.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/format.dart';
import '../../../core/themes/e_colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    super.key,
    required this.restaurantId,
    required this.tableId,
  });

  final String restaurantId;
  final int tableId;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<String> types = ['Cash', 'Credit/Debit Card'];
  String type = '';

  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: EColors.orangePrimary,
        centerTitle: true,
        title: Text(
          'Payment',
          style: EColors.black.w700.s24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        type = types[0];
                      });
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: EColors.orangeSecondary, width: 4),
                        color: type == types[0]
                            ? EColors.orangeSecondary
                            : EColors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.money_rounded,
                            size: 60,
                            color: type == types[0]
                                ? EColors.white
                                : EColors.orangeSecondary,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cash',
                                  style: type == types[0]
                                      ? EColors.white.w700.s18
                                      : EColors.black.w700.s18,
                                ),
                                Text(
                                  'Pay your orders using cash at the cashier counter',
                                  style: type == types[0]
                                      ? EColors.white.w400.s14
                                      : EColors.greyPrimary.w400.s14,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: type == types[0],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: EColors.greyTag,
                        ),
                        padding: const EdgeInsets.all(20),
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
                                Text(widget.tableId.toString()),
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
                          ],
                        ),
                      )),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        type = types[1];
                      });
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: EColors.orangeSecondary, width: 4),
                        color: type == types[1]
                            ? EColors.orangeSecondary
                            : EColors.white,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card_rounded,
                            size: 60,
                            color: type == types[1]
                                ? EColors.white
                                : EColors.orangeSecondary,
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Debit/Credit card',
                                  style: type == types[1]
                                      ? EColors.white.w700.s18
                                      : EColors.black.w700.s18,
                                ),
                                Text(
                                  'Pay your orders using debit card/credit card/QRIS',
                                  style: type == types[1]
                                      ? EColors.white.w400.s14
                                      : EColors.greyPrimary.w400.s14,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: type == types[1],
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: EColors.greyTag,
                      ),
                      padding: const EdgeInsets.all(20),
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
                              Text(widget.tableId.toString()),
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
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: type.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: EButton(
                        child: Text(
                          'Confirm Payment',
                          style: EColors.white.w700.s16,
                        ),
                        onTap: () {
                          if (controller.isLoading) return;
                          controller.addOrder(
                              widget.restaurantId, widget.tableId.toString());
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
