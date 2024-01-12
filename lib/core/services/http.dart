// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_menu_app/app.dart';

import '../environments/endpoints.dart';
import 'storage.dart';

class Http {
  static final Dio _client = Dio();

  // set header
  static void setHeader(String key, String value) {
    _client.options.headers[key] = value;
  }

  static Dio get instance {
    _client.options = BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 6),
    );

    _client.options.validateStatus = (status) => true;
    return _client;
  }

  static Future<Map<String, String>?> getTokenHeader() async {
    final String? token = await Storage.getToken();

    log('token: $token');

    if (token != null) {
      return {
        'jwt-token': token,
      };
    }
    return null;
  }

  static Future<Response> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    final response = await instance.get(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      data: body,
      queryParameters: queryParameters,
    );
    logger.d('GET $url ${response.statusCode} ${response.data}');
    return response;
  }

  static Future<Response> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    final response = await instance.post(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
    logger.d('POST $url ${response.statusCode} ${response.data}');
    return response;
  }

  static Future<Response> put(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    final response = await instance.put(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
    logger.d('PUT $url ${response.statusCode} ${response.data}');
    return response;
  }

  static Future<Response> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    final response = await instance.patch(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
      data: body,
    );
    logger.d('PATCH $url ${response.statusCode} ${response.data}');
    return response;
  }

  static Future<Response> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await instance.delete(
      url,
      options: Options(
        headers: headers ?? await getTokenHeader(),
      ),
      queryParameters: queryParameters,
    );
    logger.d('DELETE $url ${response.statusCode} ${response.data}');
    return response;
  }
}
