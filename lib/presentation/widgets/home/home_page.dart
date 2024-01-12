import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/filter_controller.dart';
import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/widgets/home/body/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/molecules/global_order_button.dart';
import '../../../core/services/storage.dart';
import '../../controllers/global_resto_controller.dart';
import '../../controllers/restaurant_controller.dart';
import '../../controllers/search_resto_controller.dart';
import 'body/search_body.dart';

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchRestoController sController = Get.put(SearchRestoController());
    final MainWrapperController controller = Get.find();
    Get.put(RestaurantController());
    final FilterController fController = Get.put(FilterController());
    final GlobalRestoController gController = Get.find();

    return Obx(
      () => Container(
        color: EColors.orangePrimary,
        child: SafeArea(
          child: Scaffold(
            floatingActionButton: Container(
              child: gController.isOrdering || Storage.containsKey('resto_id')
                  ? const GlobalOderButton()
                  : null,
            ),
            appBar: AppBar(
              toolbarHeight: 110,
              flexibleSpace: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Current Location',
                              style: EColors.white.w400.s12),
                          const Icon(Icons.pin_drop_outlined,
                              color: EColors.white, size: 16),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(controller.address, style: EColors.white.w700.s14),
                      // search bar
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 48,
                        decoration: BoxDecoration(
                          color: EColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: EColors.greyPrimary,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for restaurants',
                                  hintStyle: EColors.greyPrimary.w400,
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) => fController.clear(),
                                controller: sController.searchController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: EColors.orangePrimary,
            ),
            backgroundColor: EColors.greyBackground,
            body:
                sController.isSearching ? const SearchBody() : const HomeBody(),
          ),
        ),
      ),
    );
  }
}
