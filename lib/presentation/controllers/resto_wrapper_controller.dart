import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/domain/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/order/order_model.dart';

// Controller for handling change tab index in main page
class RestoWrapperController extends GetxController {
  final RxInt _tabIndex = 0.obs;
  final TextEditingController restoIdController = TextEditingController();
  final RxList<OrderModel> orders = <OrderModel>[].obs;
  final RxBool _isLoading = false.obs;

  int get tabIndex => _tabIndex.value;
  bool get isLoading => _isLoading.value;

  @override
  void onReady() {
    super.onReady();
    askForRestoId();
  }

  Future<void> askForRestoId() async {
    await Get.defaultDialog(
      backgroundColor: EColors.white,
      title: 'Restaurant ID',
      content: TextFormField(
        controller: restoIdController,
        decoration: const InputDecoration(
          hintText: 'Your Restaurant ID',
        ),
        onFieldSubmitted: (val) => getAllOrders(val),
      ),
    );
  }

  void getAllOrders(String restoId) async {
    _isLoading.value = true;
    orders.clear();

    await OrderRepository.getOrders(restoId).then(
      (value) => value.fold(
        (left) => Snackbar.error(
          left.message,
        ),
        (right) {
          orders.addAll(right);
          Get.back();
        },
      ),
    );

    _isLoading.value = false;
  }

  Future<bool> updateOrderStatus(
      String restoId, String orderId, String menuId) async {
    bool isUpdated = false;
    await OrderRepository.updateMenuStatus(restoId, orderId, menuId).then(
      (value) => value.fold(
        (left) => Snackbar.error(
          left.message,
        ),
        (right) {
          Snackbar.success('Order status updated');
          isUpdated = true;
        },
      ),
    );

    return isUpdated;
  }

  void setTabIndex(int value) {
    _tabIndex.value = value;
  }
}
