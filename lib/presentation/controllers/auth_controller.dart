import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/data/params/auth/auth_params.dart';
import 'package:e_menu_app/domain/repositories/auth_repository.dart';
import 'package:e_menu_app/presentation/widgets/auth/login_page.dart';
import 'package:e_menu_app/presentation/widgets/auth/success_signup_page.dart';
import 'package:e_menu_app/presentation/widgets/main_wrapper.dart';
import 'package:e_menu_app/presentation/widgets/resto_dashboard/resto_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/bases/widgets/molecules/global_order_button.dart';
import '../../core/services/storage.dart';

// Controller for handling authentication
class AuthController extends GetxController {
  final RxBool _isLogin = false.obs; // Check if user is logged in
  final RxBool _isLoading = false.obs; // Check if user is loading

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Getter
  bool get isLogin => _isLogin.value;
  bool get isLoading => _isLoading.value;

  // Setter
  void setIsLogin(bool value) {
    _isLogin.value = value;
  }

  void setIsLoading(bool value) {
    _isLoading.value = value;
  }

  void signUp(String email, String username, String password) {
    setIsLoading(true);

    // Parameter for signup
    final params = AuthParams(
      email: email,
      username: username,
      password: password,
      login_status: true,
    );

    // Call signup function from AuthRepository
    AuthRepository.signUp(params).then((value) {
      setIsLoading(false);

      value.fold((left) => Snackbar.error(left.message), (right) {
        Get.offAll(() => const SuccessSignupPage());
      });
    });
  }

  void signIn(String email, String password) async {
    setIsLoading(true);

    // Parameter for login
    final params = AuthParams(
      email: email,
      password: password,
      login_status: true,
    );

    // Call login function from AuthRepository
    await AuthRepository.login(params).then(
      (value) {
        setIsLoading(false);

        // Check if result is success or failure
        value.fold(
          (failure) {
            // If result is failure, show error message
            Snackbar.error(failure.message);
          },
          (isResto) {
            setIsLogin(true);
            // If result is success, show success message
            Snackbar.success('Login success');
            emailController.clear();
            passwordController.clear();

            if (isResto) {
              Get.offAll(() => const RestoWrapper());
            } else {
              Get.offAll(() => Scaffold(
                    body: const MainWrapper(),
                    floatingActionButton: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Storage.containsKey('resto_id')
                          ? const GlobalOderButton()
                          : null,
                    ),
                  ));
            }
          },
        );
      },
    );
  }

  void signOut() async {
    setIsLoading(true);

    await AuthRepository.signOut().then(
      (value) {
        setIsLoading(false);
        value.fold(
          (failure) {
            Snackbar.error(failure.message);
          },
          (success) {
            setIsLogin(false);
            Snackbar.success('Successfully logged out');
            Get.offAll(() => const LoginPage());
          },
        );
      },
    );
  }
}
