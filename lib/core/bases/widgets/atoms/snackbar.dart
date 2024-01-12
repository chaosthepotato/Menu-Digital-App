import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:get/get.dart';

class Snackbar {
  static void success(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: EColors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void error(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: EColors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
