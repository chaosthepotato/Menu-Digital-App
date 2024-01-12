import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/atoms/snackbar.dart';

// Sign Up Page
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: EColors.orangePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: EColors.orangePrimary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.person_outlined,
                        color: EColors.orangePrimary,
                        size: 36,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let’s Make an Account!',
                          style: EColors.black.w700.s18,
                        ),
                        Text(
                          'We’ll check if you have an account',
                          style: EColors.black.w400.s14,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 30),
                // Form Textfield
                const Text('Email'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    controller: emailController,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Username'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    controller: usernameController,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Password'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Re-enter Password'),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    obscureText: true,
                    controller: confirmPasswordController,
                  ),
                ),
                const SizedBox(height: 50),
                // Button
                Center(
                  child: InkWell(
                    onTap: () {
                      if (controller.isLoading) return;
                      if (GetUtils.isEmail(emailController.text) &&
                          passwordController.text ==
                              confirmPasswordController.text) {
                        controller.signUp(
                          emailController.text,
                          usernameController.text,
                          passwordController.text,
                        );
                      } else {
                        Snackbar.error(
                          'Please check your email and password',
                        );
                      }
                    },
                    child: Container(
                      width: context.width / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        color: EColors.orangePrimary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Obx(
                          () => controller.isLoading
                              ? const AspectRatio(
                                  aspectRatio: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      color: EColors.white,
                                    ),
                                  ),
                                )
                              : Text(
                                  'Enter',
                                  style: EColors.white.w700.s16,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
