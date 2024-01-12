import 'package:e_menu_app/core/bases/widgets/atoms/snackbar.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/widgets/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    final width = context.width;

    return Scaffold(
      backgroundColor: EColors.orangePrimary,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: EColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width),
                        bottomRight: Radius.circular(width),
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: width / 3,
                      height: width / 3,
                      decoration: BoxDecoration(
                        color: EColors.orangePrimary,
                        borderRadius: BorderRadius.circular(width / 6),
                      ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: EColors.white.w700.s18,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: EColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 48,
                          child: TextField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 16),
                            ),
                            controller: controller.emailController,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Password',
                          style: EColors.white.w700.s18,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: EColors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          height: 48,
                          child: TextField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 16),
                            ),
                            controller: controller.passwordController,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Spacer(),
                        Center(
                          child: Container(
                            width: width / 1.8,
                            height: 40,
                            decoration: BoxDecoration(
                              color: EColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Obx(
                              () => TextButton(
                                onPressed: () async {
                                  if (controller.isLoading) return;
                                  if (GetUtils.isEmail(
                                      controller.emailController.text)) {
                                    controller.signIn(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                    );
                                  } else {
                                    Snackbar.error(
                                      'Email is not valid',
                                    );
                                  }
                                },
                                child: controller.isLoading
                                    ? const AspectRatio(
                                        aspectRatio: 1,
                                        child: CircularProgressIndicator(
                                          color: EColors.orangePrimary,
                                        ),
                                      )
                                    : Text(
                                        'Enter',
                                        style: EColors.orangePrimary.w700.s18,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: width / 1.8,
                            height: 40,
                            decoration: BoxDecoration(
                              color: EColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (controller.isLoading) return;
                                Get.to(() => const SignupPage());
                              },
                              child: Text(
                                'Register',
                                style: EColors.orangePrimary.w700.s18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
