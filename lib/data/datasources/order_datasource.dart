import 'package:dio/dio.dart';
import 'package:e_menu_app/data/models/order/order_model.dart';
import 'package:e_menu_app/data/params/order/order_params.dart';
import 'package:get/get.dart' hide Response;

import '../../core/environments/endpoints.dart';
import '../../core/services/http.dart';
import '../../presentation/controllers/global_order_controller.dart';

class OrderDatasource {
  static Future<void> addOrder(
      OrderParams params, String resId, String tableId) async {
    final url = Endpoints.order
        .replaceAll('resId', resId)
        .replaceAll('tableId', tableId);
    final response = await Http.post(url, body: params.toJson());

    if (response.statusCode != 200) {
      throw (response.data['error']);
    }

    final orderId = response.data['id'];

    Get.find<GlobalOrderController>().addOrderId(orderId);

    await updateOrderStatus(resId, orderId, 'Delivery in-prog');

    return;
  }

  static Future<OrderModel> getOrderById(String resId, String orderId) async {
    final url = Endpoints.orderById
        .replaceAll('resId', resId)
        .replaceAll('orderId', orderId);
    final response = await Http.get(url);
    if (response.statusCode != 200) {
      throw (response.data['error']);
    }
    return OrderModel.fromJson(response.data);
  }

  static Future<List<OrderModel>> getOrders(String resId) async {
    int page = 1;
    final url = Endpoints.orderByRestoId.replaceAll('resId', resId);
    final List<OrderModel> orders = [];
    late Response<dynamic> response;

    do {
      response = await Http.get(url, queryParameters: {
        'page': page,
      });
      if (response.statusCode != 200) {
        if (response.data['Records_count'] == 0) {
          return orders;
        }
        throw (response.data['error']);
      }

      orders.addAll((response.data['Data'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList());
    } while (response.data['Total_pages'] > page++);

    return orders;
  }

  static Future<void> updateOrderStatus(
      String restoId, String orderId, String status) async {
    final url = Endpoints.orderUpdateOrderStatus
        .replaceAll('resId', restoId)
        .replaceAll('orderId', orderId);

    final response = await Http.patch(url, body: {
      'status': status,
    });

    if (response.statusCode != 200) {
      throw (response.data['error']);
    }
  }

  static Future<void> updateMenuStatus(
      String restoId, String orderId, String menuId) async {
    final url = Endpoints.orderUpdateMenuStatus
        .replaceAll('resId', restoId)
        .replaceAll('orderId', orderId)
        .replaceAll('menuId', menuId);

    final response = await Http.patch(url, body: {
      'status': 'Served',
    });

    if (response.statusCode != 200) {
      throw (response.data['error']);
    }
  }
}
