import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/presentation/controllers/auth_controller.dart';
import 'package:e_menu_app/presentation/widgets/profile/edit_profile_page.dart';
import 'package:e_menu_app/presentation/widgets/history/history_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/e_colors.dart';

// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.isRestaurant = false});

  final bool isRestaurant;

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: EColors.orangePrimary,
        centerTitle: true,
        title: Text(
          'Profile',
          style: EColors.black.w700.s24,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: EColors.orangePrimary,
                      width: 8,
                    ),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: const Icon(
                    Icons.person_outlined,
                    color: EColors.orangePrimary,
                    size: 90,
                  ),
                ),
                const SizedBox(height: 20),
                Text(Storage.getString('username') ?? '',
                    style: EColors.black.w700.s20),
                const SizedBox(height: 10),
                Text(Storage.getString('email') ?? '',
                    style: EColors.black.w400.s16),
                const SizedBox(height: 10),
                // Text('+6282120002000', style: EColors.black.w400.s16),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              Visibility(
                visible: !isRestaurant,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => const HistoryPage()),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          const Icon(Icons.history,
                              color: EColors.orangePrimary, size: 24),
                          const SizedBox(width: 20),
                          Text('Order History', style: EColors.black.w400.s18),
                        ],
                      ),
                    ),
                    const Divider(
                      color: EColors.greyPrimary,
                      height: 20,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.to(() => const EditProfilePage()),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.settings,
                        color: EColors.orangePrimary, size: 24),
                    const SizedBox(width: 20),
                    Text('Settings', style: EColors.black.w400.s18),
                  ],
                ),
              ),
              const Divider(
                color: EColors.greyPrimary,
                height: 20,
              ),
              InkWell(
                onTap: () => controller.signOut(),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.exit_to_app,
                        color: EColors.orangePrimary, size: 24),
                    const SizedBox(width: 20),
                    Text('Log Out', style: EColors.red.w400.s18),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
