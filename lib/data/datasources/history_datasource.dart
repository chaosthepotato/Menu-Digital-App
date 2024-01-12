import 'package:dio/dio.dart';
import 'package:e_menu_app/core/services/http.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/data/models/history/history_model.dart';

import '../../core/environments/endpoints.dart';

class HistoryDatasource {
  static Future<List<HistoryModel>> getHistory() async {
    final url = Endpoints.history + Storage.getString('email')!;

    int page = 1;
    late Response<dynamic> response;
    final List<HistoryModel> history = [];

    do {
      response = await Http.get(url, queryParameters: {
        'page': page,
      });

      if (response.statusCode != 200) {
        if (response.data['Records_count'] == 0) {
          return history;
        }
        throw (response.data['error']);
      }

      history.addAll((response.data['Data'] as List)
          .map((e) => HistoryModel.fromJson(e))
          .toList());
    } while (response.data['Total_pages'] > page++);
    return history;
  }
}
