import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/data/params/order/menu_order_params.dart';
import 'package:e_menu_app/domain/repositories/order_repository.dart';
import 'package:e_menu_app/presentation/widgets/payment/success/success_payment_page.dart';
import 'package:get/get.dart';

import '../../data/models/menu/menu_model.dart';
import '../../data/params/order/order_params.dart';

// Controller for handling an order
class OrderController extends GetxController {
  final RxInt _totalPrice = 0.obs;
  final RxBool _isLoading = false.obs;
  final RxMap<MenuModel, int> _order = <MenuModel, int>{}.obs;

  Map<MenuModel, int> get order => _order;

  bool get isLoading => _isLoading.value;
  int get totalPrice => _totalPrice.value;

  void setIsLoading(bool value) => _isLoading.value = value;
  void setTotalPrice(int value) => _totalPrice.value = value;

  // Add an order
  void addOrder(String resId, String tableId) async {
    if (isLoading) return;
    setIsLoading(true); // Set loading to true
    final email = Storage.getString('email'); // Get email from storage

    final List<MenuOrderParams> menuOrdered = [];

    // Loop through order map and add to menuOrdered
    _order.forEach((key, value) {
      menuOrdered.add(MenuOrderParams(
          menu_id: key.id, quantity: value, user_instruction: ''));
    });

    final OrderParams params = OrderParams(
        user_email: email ?? '', phone: '', menu_ordered: menuOrdered);

    final response = await OrderRepository.addOrder(params, resId, tableId);

    // Handle response
    response.fold((left) => Snackbar.error(left.message), (right) {
      Storage.saveString('resto_id', resId);

      Get.to(() => const SuccessPaymentPage());
    });

    setIsLoading(false);
  }
}
