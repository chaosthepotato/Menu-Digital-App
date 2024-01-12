import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/data/models/order/menu_order_model.dart';
import 'package:e_menu_app/presentation/controllers/global_resto_controller.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../domain/repositories/order_repository.dart';

// Controller for all orders
class GlobalOrderController extends GetxController {
  final RxList<String> _orderIds = <String>[].obs;
  final RxList<MenuOrderModel> _orders = <MenuOrderModel>[].obs;
  final RxInt _totalPrice = 0.obs;

  List<String> get orderIds => _orderIds;
  List<MenuOrderModel> get orders => _orders;
  int get totalPrice => _totalPrice.value;

  @override
  void onInit() {
    super.onInit();
    if (Storage.containsKey('order_ids')) {
      _orderIds.value = Storage.getStringList('order_ids')!;
    }
  }

  // Add order id to order list
  void addOrderId(String orderId) async {
    _orderIds.add(orderId);
    if (Storage.containsKey('order_ids')) {
      final List<String> orderIds = Storage.getStringList('order_ids')!;
      orderIds.add(orderId);
      Storage.saveStringList('order_ids', orderIds);
    } else {
      Storage.saveStringList('order_ids', [orderId]);
    }
  }

  // Get all orders
  void getOrders() async {
    _orders.clear();
    _totalPrice.value = 0;
    final restoId = Storage.getString('resto_id')!;
    for (var id in orderIds) {
      await OrderRepository.getOrderById(restoId, id).then((value) {
        value.fold((left) => Snackbar.error(left.message), (order) {
          _orders.addAll(order.menu_ordered);
          for (var menu in order.menu_ordered) {
            _totalPrice.value += menu.price * menu.quantity;
          }
        });
      });
    }
  }

  // Remove all order id from order list
  void closeOrder() async {
    final String orderId = _orderIds[0];
    final String restoId = Storage.getString('resto_id')!;
    for (final id in _orderIds) {
      await OrderRepository.updateOrderStatus(restoId, id, 'Served');
    }
    _orderIds.clear();
    _orders.clear();
    _totalPrice.value = 0;
    Storage.removeKey('order_ids');
    Storage.removeKey('resto_id');
    final GlobalRestoController restoController = Get.find();
    restoController.setIsOrdering(false);
    Get.back();
    showReviewDialog(restoId, orderId);
  }

  // Show review dialog
  void showReviewDialog(String restoId, String orderId) async {
    int rating = 0;
    final TextEditingController reviewController = TextEditingController();
    final RestaurantController restoController = Get.find();
    await Get.defaultDialog(
      buttonColor: EColors.orangePrimary,
      backgroundColor: EColors.white,
      contentPadding: const EdgeInsets.all(20),
      titlePadding: const EdgeInsets.all(20),
      title: 'Thank you for ordering!',
      onWillPop: () async {
        return false;
      },
      barrierDismissible: false,
      content: Column(
        children: [
          Text('Please leave a review for this restaurant',
              textAlign: TextAlign.center, style: EColors.black.w500.s16),
          const SizedBox(height: 20),
          RatingBar.builder(
            minRating: 1,
            glowColor: Colors.amber,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (value) {
              rating = value.toInt();
            },
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: reviewController,
              decoration: InputDecoration(
                hintText: 'Write your review here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 5,
            ),
          ),
        ],
      ),
      textConfirm: restoController.isFetching ? 'Submitting...' : 'Submit',
      textCancel: 'No, thanks',
      cancelTextColor: EColors.orangePrimary,
      onConfirm: () async {
        restoController.addReview(
            rating, reviewController.text, restoId, orderId);
        Get.back();
        Get.defaultDialog(
          titlePadding: const EdgeInsets.all(20),
          buttonColor: EColors.orangePrimary,
          title: 'Thank you for your review!',
          content: const Text('Have a nice day!'),
          textConfirm: 'Ok',
          onConfirm: () {
            Get.back();
          },
        );
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
