import 'package:e_menu_app/data/datasources/history_datasource.dart';
import 'package:e_menu_app/data/models/history/history_model.dart';
import 'package:either_dart/either.dart';

import '../../core/client/api_call.dart';
import '../../core/errors/failure.dart';

class HistoryRepository {
  static Future<Either<Failure, List<HistoryModel>>> getHistory() async {
    return await apiCall(HistoryDatasource.getHistory());
  }
}
