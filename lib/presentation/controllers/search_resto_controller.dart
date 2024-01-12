import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for search restaurant in home page
class SearchRestoController extends GetxController {
  final RxBool _isSearching = false.obs;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchCategoryController =
      TextEditingController();
  final RxList<RestaurantModel> _restaurants = <RestaurantModel>[].obs;

  bool get isSearching => _isSearching.value;

  RxList<RestaurantModel> get restaurants => _restaurants;

  void setIsSearching(bool value) {
    _isSearching.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(searchListener);
  }

  // listener for searchController in Home Page (Search Bar)
  void searchListener() {
    if (searchController.text.isEmpty) {
      setIsSearching(false);
    } else {
      searchRestaurant();
    }
  }

  // listener for searchCategoryController in Category Page
  void searchCategoryOnChanged(String category, String value) {
    if (searchCategoryController.text.isEmpty) {
      setIsSearching(false);
    } else {
      searchCategory(category, value);
    }
  }

  // Search restaurant by name in Home Page (Search Bar)
  void searchRestaurant() {
    final RestaurantController controller = Get.find();
    setIsSearching(true);

    _restaurants.clear();

    for (final RestaurantModel resto in controller.restaurant ?? []) {
      if (resto.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        _restaurants.add(resto);
      }
    }
  }

  // Search restaurant by name in Category Page
  void searchCategory(String category, String value) {
    final RestaurantController controller = Get.find();
    setIsSearching(true);

    final List<RestaurantModel> restoCategory =
        controller.categories[category] ?? [];

    _restaurants.clear();

    for (final RestaurantModel resto in restoCategory) {
      if (resto.name.toLowerCase().contains(value.toLowerCase())) {
        _restaurants.add(resto);
      }
    }
  }
}
