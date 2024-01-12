import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:e_menu_app/presentation/controllers/search_resto_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/bases/widgets/atoms/filter_tag.dart';
import '../../core/themes/e_colors.dart';
import '../../data/models/restaurant/restaurant_model.dart';

// Filter Controller in Search Page and Category Page
class FilterController extends GetxController {
  final RxInt _distanceIndex =
      0.obs; // 0 = no filter, 1 = nearest, 2 = furthest
  final RxInt _rating = 0.obs; // 0 = no filter, 1-5 = rating
  final RxInt _pricingIndex = 0.obs; // 0 = no filter, 1 = highest, 2 = lowest
  final RxInt _statusIndex = 0.obs; // 0 = no filter, 1 = open, 2 = closed
  final SearchRestoController sController = Get.find(); // Search Controller
  final RestaurantController controller = Get.find(); // Restaurant Controller
  final MainWrapperController mController =
      Get.find(); // Main Wrapper Controller
  final RxString category = ''.obs; // Category

  // Getters
  int get distanceIndex => _distanceIndex.value;
  int get rating => _rating.value;
  int get pricingIndex => _pricingIndex.value;
  int get statusIndex => _statusIndex.value;

  // Setters
  void setCategory(String value) {
    category.value = value;
  }

  void setDistanceIndex(int value) {
    _distanceIndex.value = value;

    if (value == 0) return;

    // Sort from nearest to furthest
    if (value == 1) {
      sController.restaurants.sort((a, b) => Geolocator.distanceBetween(
              double.tryParse(a.address.latitude) ?? 0,
              double.tryParse(a.address.longitude) ?? 0,
              mController.latitude,
              mController.longitude)
          .compareTo(Geolocator.distanceBetween(
              double.tryParse(b.address.latitude) ?? 0,
              double.tryParse(b.address.longitude) ?? 0,
              mController.latitude,
              mController.longitude)));
    }
    // Sort from furthest to nearest
    else if (value == 2) {
      sController.restaurants.sort((a, b) => Geolocator.distanceBetween(
              double.tryParse(b.address.latitude) ?? 0,
              double.tryParse(b.address.longitude) ?? 0,
              mController.latitude,
              mController.longitude)
          .compareTo(Geolocator.distanceBetween(
              double.tryParse(a.address.latitude) ?? 0,
              double.tryParse(a.address.longitude) ?? 0,
              mController.latitude,
              mController.longitude)));
    }
  }

  void setRating(int value) {
    _rating.value = value;

    // set rating in Category Page
    if (category.isNotEmpty) {
      sController.setIsSearching(true);

      final allRestaurants = controller.restaurant;
      final filteredRestaurants = <RestaurantModel>[];

      for (final RestaurantModel resto in allRestaurants ?? []) {
        if (resto.rating.round() == value && resto.category == category.value) {
          filteredRestaurants.add(resto);
        }
      }

      sController.restaurants.clear();
      sController.restaurants.addAll(filteredRestaurants);
    }
    // set rating in Home Page (search page)
    else {
      sController.setIsSearching(true);

      final allRestaurants = controller.restaurant;
      final filteredRestaurants = <RestaurantModel>[];

      for (final RestaurantModel resto in allRestaurants ?? []) {
        if (resto.rating.round() == value) {
          filteredRestaurants.add(resto);
        }
      }

      sController.restaurants.clear();
      sController.restaurants.addAll(filteredRestaurants);
    }
  }

  void setPricingIndex(int value) {
    _pricingIndex.value = value;

    if (value == 0) return;

    if (category.isNotEmpty) {
      sController.searchCategory(
          category.value, sController.searchController.text);
    }

    // Sort from highest to lowest
    if (value == 1) {
      sController.restaurants
          .sort((a, b) => b.average_pricing.compareTo(a.average_pricing));
    } else if (value == 2) {
      // Sort from lowest to highest
      sController.restaurants
          .sort((a, b) => a.average_pricing.compareTo(b.average_pricing));
    }
  }

  void setStatusIndex(int value) {
    _statusIndex.value = value;

    if (value == 0) {
      sController.restaurants.clear();
      sController.searchRestaurant();
    }

    // filter open restaurants
    if (value == 1) {
      sController.restaurants
          .removeWhere((element) => element.available_status == false);
    }
  }

  // Check if there is any filter
  bool isFiltering() {
    return _distanceIndex.value != 0 ||
        _rating.value != 0 ||
        _pricingIndex.value != 0 ||
        _statusIndex.value != 0;
  }

  // Clear all filters
  void clear() {
    _distanceIndex.value = 0;
    _rating.value = 0;
    _pricingIndex.value = 0;
    _statusIndex.value = 0;
  }

  // Show Filter Bottom Sheet
  void showFilterBottomSheet() async {
    await Get.bottomSheet(
      Obx(
        () => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: EColors.white,
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filter', style: EColors.black.w700.s16),
                  InkWell(
                    onTap: () {
                      clear();
                      if (sController.searchController.text.isNotEmpty) {
                        sController.restaurants.clear();
                        sController.searchRestaurant();
                      } else {
                        sController.setIsSearching(false);
                      }
                    },
                    child: Text(
                      'Clear filter',
                      style: EColors.greyPrimary.w500.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: EColors.greyPrimary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text('Distance', style: EColors.black.w700.s16),
              const SizedBox(height: 10),
              Row(
                children: [
                  FilterTag(
                    name: 'Nearest',
                    isInverted: true,
                    isActive: _distanceIndex.value == 1,
                    onTap: () => setDistanceIndex(1),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: 'Furthest',
                    isInverted: true,
                    isActive: _distanceIndex.value == 2,
                    onTap: () => setDistanceIndex(2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Ratings', style: EColors.black.w700.s16),
              const SizedBox(height: 10),
              Row(
                children: [
                  FilterTag(
                    name: '1',
                    isInverted: true,
                    icon: Icons.star,
                    isActive: _rating.value == 1,
                    onTap: () => setRating(1),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: '2',
                    isInverted: true,
                    icon: Icons.star,
                    isActive: _rating.value == 2,
                    onTap: () => setRating(2),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: '3',
                    isInverted: true,
                    icon: Icons.star,
                    isActive: _rating.value == 3,
                    onTap: () => setRating(3),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: '4',
                    isInverted: true,
                    icon: Icons.star,
                    isActive: _rating.value == 4,
                    onTap: () => setRating(4),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: '5',
                    isInverted: true,
                    icon: Icons.star,
                    isActive: _rating.value == 5,
                    onTap: () => setRating(5),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 20),
              Text('Pricing', style: EColors.black.w700.s16),
              const SizedBox(height: 10),
              Row(
                children: [
                  FilterTag(
                    name: 'Highest',
                    isInverted: true,
                    isActive: _pricingIndex.value == 1,
                    onTap: () => setPricingIndex(1),
                  ),
                  const SizedBox(width: 8),
                  FilterTag(
                    name: 'Lowest',
                    isInverted: true,
                    isActive: _pricingIndex.value == 2,
                    onTap: () => setPricingIndex(2),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Status', style: EColors.black.w700.s16),
              const SizedBox(height: 10),
              Row(
                children: [
                  FilterTag(
                      name: 'Open',
                      isInverted: true,
                      onTap: () => setStatusIndex(1),
                      isActive: _statusIndex.value == 1),
                  const SizedBox(width: 8),
                  FilterTag(
                      name: 'Closed',
                      isInverted: true,
                      onTap: () => setStatusIndex(2),
                      isActive: _statusIndex.value == 2),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
