import 'package:e_menu_app/data/datasources/restaurant_datasource.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/data/models/review/review_model.dart';
import 'package:e_menu_app/data/models/review/review_params.dart';
import 'package:either_dart/either.dart';

import '../../core/client/api_call.dart';
import '../../core/errors/failure.dart';

class RestaurantRepository {
  static Future<Either<Failure, List<RestaurantModel>>>
      fetchRestaurant() async {
    return await apiCall(RestaurantDatasource.getAll());
  }

  static Future<Either<Failure, List<ReviewModel>>> fetchReview(
      int restaurantId) async {
    return await apiCall(RestaurantDatasource.getReview(restaurantId));
  }

  static Future<Either<Failure, ReviewModel>> addReview(
      ReviewParams params, String email, String orderId, String restoId) async {
    return await apiCall(
        RestaurantDatasource.addReview(params, email, orderId, restoId));
  }
}
