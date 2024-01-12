import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_menu_app/core/services/http.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/data/models/review/review_model.dart';
import 'package:e_menu_app/data/models/review/review_params.dart';

import '../../core/environments/endpoints.dart';

class RestaurantDatasource {
  static Future<List<RestaurantModel>> getAll() async {
    const url = Endpoints.restaurant;
    int page = 1;
    final List<RestaurantModel> restaurants = [];
    late Response<dynamic> response;

    do {
      response = await Http.get(url, queryParameters: {
        'page': page,
      });

      if (response.statusCode != 200) {
        throw (response.data['error']);
      }

      restaurants.addAll((response.data['Data'] as List)
          .map((e) => RestaurantModel.fromJson(e))
          .toList());
    } while (response.data['Total_pages'] > page++);

    return restaurants;
  }

  static Future<List<ReviewModel>> getReview(int restaurantId) async {
    final url = Endpoints.review.replaceAll('x', restaurantId.toString());

    int page = 1;
    final List<ReviewModel> reviews = [];
    late Response<dynamic> response;

    do {
      response = await Http.get(url, queryParameters: {
        'page': page,
      });

      if (response.statusCode == 400) {
        return [];
      } else if (response.statusCode != 200) {
        throw (response.data['error']);
      }
      reviews.addAll((response.data['Data'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList());
    } while (response.data['Total_pages'] > page++);

    log(reviews.toString());

    return reviews;
  }

  static Future<ReviewModel> addReview(
      ReviewParams params, String email, String orderId, String restoId) async {
    final url = Endpoints.reviewAdd
        .replaceAll('restoId', restoId)
        .replaceAll('orderId', orderId)
        .replaceAll('email', email);
    final response = await Http.post(
      url,
      body: params.toJson(),
    );

    if (response.statusCode != 200) {
      throw (response.data['error']);
    }
    return ReviewModel.fromJson(response.data);
  }
}
