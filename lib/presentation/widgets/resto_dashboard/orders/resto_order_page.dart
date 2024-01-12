import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';

import 'package:e_menu_app/presentation/controllers/resto_wrapper_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cards/resto_table_card.dart';
import 'resto_menu_page.dart';

class RestoOrderPage extends StatelessWidget {
  const RestoOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RestoWrapperController controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Orders', style: EColors.black.w700.s24),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (controller.restoIdController.text.isNotEmpty) {
              controller.getAllOrders(controller.restoIdController.text);
            } else {
              controller.askForRestoId();
            }
          },
          child: const Icon(Icons.refresh),
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                ),
              )
            : controller.orders.isEmpty
                ? Center(
                    child: Text('No order', style: EColors.black.w700.s24),
                  )
                : ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(
                            () => RestoMenuPage(
                              menus: controller.orders[index].menu_ordered,
                              tableId: controller.orders[index].table_id,
                              restoId: controller.restoIdController.text,
                            ),
                          )!
                              .then((value) => controller.getAllOrders(
                                  controller.restoIdController.text));
                        },
                        child: RestoTableCard(
                          orderCount:
                              controller.orders[index].menu_ordered.length,
                          tableId: controller.orders[index].table_id,
                          status: controller.orders[index].status,
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
