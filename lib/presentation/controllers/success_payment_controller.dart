import 'package:e_menu_app/presentation/controllers/global_resto_controller.dart';

import 'package:get/get.dart';

// Controller for handling success payment (play success animation)
class SuccessPaymentController extends GetxController {
  final _isImage = false.obs;
  final _isCheck = false.obs;
  final _isText = false.obs;
  final _isIcon = false.obs;

  bool get isImage => _isImage.value;
  bool get isCheck => _isCheck.value;
  bool get isText => _isText.value;
  bool get isIcon => _isIcon.value;

  void setSuccess() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isImage.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    _isCheck.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    _isText.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    _isIcon.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.back();
    Get.back();
    Get.back(result: true);

    Get.find<GlobalRestoController>().setIsOrdering(true);
  }
}
