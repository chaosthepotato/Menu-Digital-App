import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

// Success Signup Page
class SuccessSignupPage extends StatelessWidget {
  const SuccessSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EColors.orangePrimary,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Icon(
              Icons.check_circle_rounded,
              color: EColors.white,
              size: 128,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            'ACCOUNT CREATED!',
            style: EColors.white.w700.s24,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'YOU CAN NOW LOGIN TO YOUR NEW ACCOUNT',
            style: EColors.white.w700.s14,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          InkWell(
            onTap: () => Get.offAll(() => const LoginPage()),
            child: Container(
              height: 50,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: EColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Continue',
                  style: EColors.orangePrimary.w700.s16,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
