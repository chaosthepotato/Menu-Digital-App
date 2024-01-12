import 'package:e_menu_app/data/models/menu/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller for search menu in restaurant page
class SearchMenuController extends GetxController {
  final RxList<MenuModel> _allMenus = <MenuModel>[].obs;
  final RxList<MenuModel> _menus = <MenuModel>[].obs;

  final TextEditingController searchController = TextEditingController();

  List<MenuModel> get menus => _menus;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchMenu();
    });
  }

  void setAllMenus(List<MenuModel> value) {
    _allMenus.clear();
    _allMenus.addAll(value);
    _menus.clear();
    _menus.addAll(value);
  }

  // Search menu by name
  void searchMenu() {
    _menus.clear();

    for (final MenuModel menu in _allMenus) {
      if (menu.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        _menus.add(menu);
      }
    }
  }
}
