import 'package:e_menu_app/data/datasources/order_datasource.dart';
import 'package:e_menu_app/data/models/order/order_model.dart';
import 'package:e_menu_app/data/params/order/order_params.dart';
import 'package:either_dart/either.dart';

import '../../core/client/api_call.dart';
import '../../core/errors/failure.dart';

class OrderRepository {
  static Future<Either<Failure, void>> addOrder(
      OrderParams params, String resId, String tableId) async {
    return await apiCall(OrderDatasource.addOrder(params, resId, tableId));
  }

  static Future<Either<Failure, OrderModel>> getOrderById(
      String resId, String orderId) async {
    return await apiCall(OrderDatasource.getOrderById(resId, orderId));
  }

  static Future<Either<Failure, List<OrderModel>>> getOrders(
      String resId) async {
    return await apiCall(OrderDatasource.getOrders(resId));
  }

  static Future<Either<Failure, void>> updateOrderStatus(
      String restoId, String orderId, String status) async {
    return await apiCall(
        OrderDatasource.updateOrderStatus(restoId, orderId, status));
  }

  static Future<Either<Failure, void>> updateMenuStatus(
      String restoId, String orderId, String menuId) async {
    return await apiCall(
        OrderDatasource.updateMenuStatus(restoId, orderId, menuId));
  }
}
