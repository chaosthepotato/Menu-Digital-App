import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/presentation/widgets/resto_dashboard/resto_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'core/themes/e_colors.dart';
import 'presentation/controllers/auth_controller.dart';
import 'presentation/widgets/auth/login_page.dart';
import 'presentation/widgets/main_wrapper.dart';

final logger = Logger();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find();

    return GetMaterialApp(
      title: 'E Menu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: EColors.white,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: EColors.orangePrimary,
        ),
        primaryColor: EColors.orangePrimary,
        useMaterial3: true,
      ),
      home: controller.isLogin
          ? Storage.getBool('is_restaurant') ?? false
              ? const RestoWrapper()
              : const MainWrapper()
          : const LoginPage(),
    );
  }
}
