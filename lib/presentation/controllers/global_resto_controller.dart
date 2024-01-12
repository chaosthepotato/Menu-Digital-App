import 'package:e_menu_app/core/services/storage.dart';
import 'package:get/get.dart';

// Controller for tell if user is ordering or not
class GlobalRestoController extends GetxController {
  final RxBool _isOrdering = false.obs;

  bool get isOrdering => _isOrdering.value;

  @override
  void onInit() {
    super.onInit();
    _isOrdering.value = Storage.containsKey('resto_id');
  }

  void setIsOrdering(bool value) => _isOrdering.value = value;
}
