import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/history_controller.dart';
import 'package:e_menu_app/presentation/widgets/history/card/history_resto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/e_colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController hController = Get.put(HistoryController())
      ..fetchHistory();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          foregroundColor: EColors.orangePrimary,
          centerTitle: true,
          title: Text(
            'History',
            style: EColors.black.w700.s24,
          ),
        ),
        body: hController.isFetching
            ? const Center(child: CircularProgressIndicator())
            : hController.history.isEmpty
                ? const Center(
                    child: Text('No history'),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(
                          hController.history.length,
                          (index) => HistoryRestoCard(
                            history: hController.history[index],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
