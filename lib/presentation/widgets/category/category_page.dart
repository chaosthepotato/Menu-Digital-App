import 'package:e_menu_app/core/bases/widgets/molecules/filter_bar.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/filter_controller.dart';
import 'package:e_menu_app/presentation/controllers/global_resto_controller.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:e_menu_app/presentation/widgets/home/card/search_resto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../core/bases/widgets/molecules/global_order_button.dart';
import '../../controllers/main_wrapper_controller.dart';
import '../../controllers/search_resto_controller.dart';

// Category Page
class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.find();
    final SearchRestoController sController = Get.find()
      ..searchCategoryController.clear();
    final FilterController fController = Get.put(FilterController());
    final MainWrapperController mController = Get.find();
    final GlobalRestoController gController = Get.find();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        flexibleSpace: Image.network(
          controller.categories[category]!.first.restaurant_photo_url,
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
      floatingActionButton: Obx(
        () => Container(
          child: gController.isOrdering || Storage.containsKey('resto_id')
              ? const GlobalOderButton()
              : null,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(category, style: EColors.black.w700.s16),
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
                ],
              ),
            ),
            FilterBar(category: category),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                        SearchBar(
                          constraints: BoxConstraints.tight(
                              const Size(double.infinity, 32)),
                          backgroundColor:
                              const MaterialStatePropertyAll(EColors.greyTag),
                          elevation: const MaterialStatePropertyAll(0),
                          leading: const Icon(Icons.search,
                              color: EColors.greyPrimary),
                          textStyle: const MaterialStatePropertyAll(
                            TextStyle(fontSize: 12),
                          ),
                          hintText: 'Search for restaurants',
                          hintStyle: const MaterialStatePropertyAll(
                            TextStyle(color: EColors.greyPrimary, fontSize: 12),
                          ),
                          onChanged: (value) {
                            sController.searchCategoryOnChanged(
                                category, value);
                            fController.clear();
                          },
                          controller: sController.searchCategoryController,
                        ),
                      ] +
                      List.generate(
                        sController.isSearching
                            ? sController.restaurants.length
                            : controller.categories[category]!.length,
                        (index) => SearchRestoCard(
                          restaurant: sController.isSearching
                              ? sController.restaurants[index]
                              : controller.categories[category]![index],
                        ),
                      ) +
                      [
                        if (sController.isSearching &&
                            sController.restaurants.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(height: 30),
                                const Icon(
                                  Icons.search,
                                  color: EColors.greyPrimary,
                                  size: 132,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Search for your desired food in the search bar above',
                                  textAlign: TextAlign.center,
                                  style: EColors.greyPrimary.w400.s20,
                                ),
                              ],
                            ),
                          ),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
