import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/data/models/history/history_model.dart';
import 'package:get/get.dart';

import '../../domain/repositories/history_repository.dart';

class HistoryController extends GetxController {
  final RxBool _isFetching = false.obs;
  final List<HistoryModel> _history = <HistoryModel>[].obs;

  bool get isFetching => _isFetching.value;
  List<HistoryModel> get history => _history;

  void setIsFetching(bool value) {
    _isFetching.value = value;
  }

  void setHistory(List<HistoryModel> value) {
    _history.addAll(value);
  }

  void fetchHistory() async {
    _history.clear();
    setIsFetching(true);
    final history = await HistoryRepository.getHistory();
    history.fold(
      (failure) => Snackbar.error(failure.message),
      (history) {
        setHistory(history);
      },
    );
    setIsFetching(false);
  }
}
