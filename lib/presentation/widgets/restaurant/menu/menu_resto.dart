import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/controllers/search_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/e_colors.dart';
import '../../../../data/models/restaurant/restaurant_model.dart';
import '../card/menu_card.dart';

// Menu section on Restaurant Page
class MenuResto extends StatelessWidget {
  const MenuResto({
    super.key,
    required this.restaurant,
    this.tableId,
  });

  final RestaurantModel restaurant;
  final int? tableId;

  @override
  Widget build(BuildContext context) {
    final SearchMenuController controller = Get.find();
    final MainWrapperController mController = Get.find();

    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                Text(restaurant.name, style: EColors.black.w700.s20),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Current Location ',
                      style: EColors.orangePrimary.w400.s12,
                    ),
                    Text(
                      mController.address,
                      style: EColors.orangePrimary.w700.s14,
                    ),
                    const Icon(
                      Icons.pin_drop_outlined,
                      size: 16,
                      color: EColors.orangePrimary,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SearchBar(
                  constraints:
                      BoxConstraints.tight(const Size(double.infinity, 32)),
                  backgroundColor:
                      const MaterialStatePropertyAll(EColors.greyTag),
                  elevation: const MaterialStatePropertyAll(0),
                  leading: const Icon(Icons.search, color: EColors.greyPrimary),
                  textStyle: const MaterialStatePropertyAll(
                    TextStyle(fontSize: 12),
                  ),
                  hintText: 'Search for food',
                  hintStyle: const MaterialStatePropertyAll(
                    TextStyle(color: EColors.greyPrimary, fontSize: 12),
                  ),
                  onChanged: (value) {},
                  controller: controller.searchController,
                ),
                const SizedBox(height: 20),
              ] +
              List.generate(
                controller.menus.length,
                (index) {
                  return MenuCard(
                    menu: controller.menus[index],
                    index: index,
                    tableId: tableId,
                  );
                },
              ) +
              [
                Offstage(
                  offstage: controller.menus.isNotEmpty,
                  child: Container(
                      padding: const EdgeInsets.only(top: 120),
                      child: const Center(child: Text('No menu found'))),
                )
              ],
        ),
      ),
    );
  }
}
