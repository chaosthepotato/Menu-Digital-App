import 'package:e_menu_app/core/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'presentation/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting('id_ID', null);

  // Initialize Storage
  await Storage.init();
  // Initialize AuthController
  final auth = Get.put(AuthController());

  // Check if token is exist
  if (await Storage.containsToken()) {
    auth.setIsLogin(true);
  }

  runApp(const App());
}
