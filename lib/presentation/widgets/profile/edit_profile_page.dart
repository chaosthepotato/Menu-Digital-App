import 'package:e_menu_app/core/bases/widgets/atoms/filter_tag.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/services/storage.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/bases/widgets/atoms/snackbar.dart';

// Edit Profile Page
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isViewPassword = false;
  bool isViewConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    emailController.text = Storage.getString('email') as String;
    usernameController.text = Storage.getString('username') as String;
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Obx(
      () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: EColors.orangePrimary,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Edit Profile',
                style: EColors.black.w700.s20,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: EColors.orangePrimary,
                          width: 6,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.person_outlined,
                        color: EColors.orangePrimary,
                        size: 72,
                      ),
                    ),
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
                        suffix: Icon(
                          Icons.check,
                          color: EColors.orangePrimary,
                          size: 20,
                        ),
                      ),
                      readOnly: true,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        suffix: SizedBox(
                          width: 53,
                          child: FilterTag(
                            name: 'View',
                            color: EColors.orangeSecondary,
                            isActive: true,
                            onTap: () => setState(() {
                              isViewPassword = !isViewPassword;
                            }),
                          ),
                        ),
                      ),
                      obscureText: !isViewPassword,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        suffix: SizedBox(
                          width: 53,
                          child: FilterTag(
                            name: 'View',
                            color: EColors.orangeSecondary,
                            isActive: true,
                            onTap: () => setState(() {
                              isViewConfirmPassword = !isViewConfirmPassword;
                            }),
                          ),
                        ),
                      ),
                      obscureText: !isViewConfirmPassword,
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
                          controller.updateProfile(
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
                          child: controller.isLoading
                              ? const CircularProgressIndicator(
                                  color: EColors.white,
                                )
                              : Text(
                                  'Save',
                                  style: EColors.white.w700.s16,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
