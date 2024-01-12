import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/restaurant_page.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

// Controller for handling QR
class QRContoller extends GetxController {
  void scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      Get.snackbar('Error', 'Invalid QR Code');
      return;
    } else {
      final String trimmedBarcode = barcode.removeAllWhitespace;

      try {
        final int tableId =
            int.tryParse(trimmedBarcode.split(',')[0].split(':')[1]) ?? 0;
        final int restoId =
            int.tryParse(trimmedBarcode.split(',')[1].split(':')[1]) ?? 0;
        final RestaurantController restoController = Get.find();
        for (final RestaurantModel resto in restoController.restaurant!) {
          if (resto.id == restoId) {
            Get.to(() => RestaurantPage(
                  restaurant: resto,
                  tableId: tableId,
                ));
            return;
          }
        }
      } catch (e) {
        Get.back();
        Snackbar.error('Invalid QR Code');
        return;
      }
    }
  }
}
