import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/e_colors.dart';

class RestoTableCard extends StatelessWidget {
  const RestoTableCard({
    required this.orderCount,
    required this.tableId,
    required this.status,
    super.key,
  });

  final int orderCount;
  final int tableId;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.asset(
                'assets/icons/${mapStatusToImage(status)}.png',
                width: 60,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Table No. $tableId',
                      style: EColors.black.w700.s14,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$orderCount Orders in total',
                      style: EColors.greyPrimary.w400.s10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              //button
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: status == 'Served'
                      ? EColors.orangePrimary
                      : EColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: EColors.orangePrimary,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: status == 'Served'
                        ? EColors.white.w700.s12
                        : EColors.orangePrimary.w700.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: EColors.greyPrimary,
        ),
      ],
    );
  }

  String mapStatusToImage(String status) {
    if (status.toLowerCase().contains('payment')) return 'money';
    if (status.toLowerCase().contains('process')) return 'bell';
    if (status.toLowerCase().contains('served')) return 'check';
    return 'money';
  }
}
