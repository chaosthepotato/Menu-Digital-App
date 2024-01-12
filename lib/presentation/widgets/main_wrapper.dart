import 'package:e_menu_app/presentation/controllers/global_resto_controller.dart';
import 'package:e_menu_app/presentation/controllers/main_wrapper_controller.dart';
import 'package:e_menu_app/presentation/controllers/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/bases/widgets/molecules/navbar.dart';
import '../controllers/global_order_controller.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

// Main Page Wrapper (Home, QR, Profile)
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final MainWrapperController controller = Get.put(MainWrapperController());
    final QRContoller qrController = Get.put(QRContoller());
    Get.put(GlobalOrderController());
    Get.put(GlobalRestoController());

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomePage(),
              SizedBox(), // QRPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Navbar(
            initialActiveIndex: controller.tabIndex,
            items: const [
              Icons.home_outlined,
              Icons.qr_code_scanner,
              Icons.person_2_outlined,
            ],
            onTap: (index) {
              switch (index) {
                case 1:
                  qrController.scan();
                  break;
                case 2:
                  Get.to(() => const ProfilePage());
                  break;
                default:
                  controller.tabIndex = index;
              }
            },
          ),
        ));
  }
}
