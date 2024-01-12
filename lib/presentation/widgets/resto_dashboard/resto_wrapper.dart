import 'package:e_menu_app/presentation/widgets/resto_dashboard/orders/resto_order_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/molecules/navbar.dart';
import '../../controllers/resto_wrapper_controller.dart';
import '../profile/profile_page.dart';

// Main Page Wrapper (Home, QR, Profile)
class RestoWrapper extends StatelessWidget {
  const RestoWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final RestoWrapperController controller = Get.put(RestoWrapperController())
      ..orders.clear();

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            RestoOrderPage(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: Navbar(
          initialActiveIndex: controller.tabIndex,
          items: const [
            Icons.menu,
            Icons.person_2_outlined,
          ],
          onTap: (index) {
            if (index == 1) {
              Get.to(() => const ProfilePage(
                    isRestaurant: true,
                  ));
            } else {
              controller.setTabIndex(index);
            }
          },
        ),
      ),
    );
  }
}
