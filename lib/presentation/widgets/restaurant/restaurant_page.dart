import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/presentation/controllers/global_resto_controller.dart';
import 'package:e_menu_app/presentation/controllers/order_controller.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:e_menu_app/presentation/controllers/search_menu_controller.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/about/about_resto.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/menu/menu_resto.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/reviews/review_resto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../core/bases/widgets/molecules/global_order_button.dart';
import '../order/order_page.dart';
import '../../../core/bases/widgets/molecules/resto_tab_bar.dart';

// Restaurant Page (Contains Menu, About, and Reviews)
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurant, this.tableId});

  final RestaurantModel restaurant;
  final int? tableId;

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.find()..setTabIndex(0);
    final OrderController orderController = Get.put(OrderController())
      ..setTotalPrice(0)
      ..order.clear();
    final GlobalRestoController gController = Get.find();
    Get.put(SearchMenuController()).setAllMenus(restaurant.menus ?? []);

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          flexibleSpace: Image.network(
            restaurant.restaurant_photo_url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const InvalidImage(),
          ),
          leadingWidth: 50,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 60),
            child: InkWell(
              onTap: () => Get.back(),
              child: const CircleAvatar(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: Container(
          child: gController.isOrdering || Storage.containsKey('resto_id')
              ? const GlobalOderButton()
              : null,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        RestoTabBar(),
                      ],
                    ),
                  ),
                  if (controller.tabIndex == 0)
                    MenuResto(
                      restaurant: restaurant,
                      tableId: tableId,
                    ),
                  if (controller.tabIndex == 1)
                    AboutResto(restaurant: restaurant),
                  if (controller.tabIndex == 2)
                    ReviewResto(restaurant: restaurant),
                ],
              ),
            ),
            Offstage(
              offstage: !(orderController.totalPrice != 0 &&
                  controller.tabIndex == 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                    color: EColors.orangeSecondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () => Get.to(() => OrderPage(
                              restaurantId: restaurant.id.toString(),
                              tableId: tableId!,
                              //TODO (Adiet) : uncomment this (DONE)
                              // tableId: 9,
                            ))!
                        .then((value) {
                      if (value == true) {
                        orderController.setTotalPrice(0);
                        orderController.order.clear();
                      }
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.list,
                          color: EColors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'View Orders',
                          style: EColors.white.w700.s12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
