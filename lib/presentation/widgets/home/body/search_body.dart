import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/widgets/home/card/search_resto_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/molecules/filter_bar.dart';
import '../../../../core/themes/e_colors.dart';
import '../../../controllers/search_resto_controller.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchRestoController sController = Get.find();

    return Container(
      color: EColors.white,
      height: double.infinity,
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: FilterBar(),
              ),
              sController.restaurants.isEmpty
                  ? Padding(
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
                            'Search for your desired restaurant or food in the search bar above',
                            textAlign: TextAlign.center,
                            style: EColors.greyPrimary.w400.s20,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: List.generate(
                          sController.restaurants.length,
                          (index) => SearchRestoCard(
                            restaurant: sController.restaurants[index],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
