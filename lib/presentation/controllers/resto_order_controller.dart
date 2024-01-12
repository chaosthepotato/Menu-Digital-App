import 'package:get/get.dart';

// Controller for handling orders from resto side
class RestoOrderController extends GetxController {
  final RxBool _isActive = false.obs;

  bool get isActive => _isActive.value;

  void setActive(bool value) {
    _isActive.value = value;
  }
}
