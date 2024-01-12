import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/presentation/controllers/success_payment_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';

// Success Payment Page
class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SuccessPaymentController controller =
        Get.put(SuccessPaymentController())..setSuccess();
    return Obx(
      () => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: EColors.orangePrimary,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    AnimatedOpacity(
                        opacity: controller.isImage ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const HeaderImage()),
                    AnimatedOpacity(
                      opacity: controller.isCheck ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const CheckIcon(),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: controller.isText ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const SuccessText(),
                    ),
                    const SizedBox(height: 20),
                    AnimatedOpacity(
                      opacity: controller.isIcon ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const SuccessIcon(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Image.asset(
        'assets/icons/success_payment.png',
      ),
    );
  }
}

class SuccessText extends StatelessWidget {
  const SuccessText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text('ORDER RECEIVED!', style: EColors.white.w700.s24),
          Text(
            'WE ARE CURRENTLY PREPARING YOUR FOOD',
            style: EColors.white.w700.s16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CheckIcon extends StatelessWidget {
  const CheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: CircleAvatar(
        radius: 60,
        child: Icon(
          Icons.check,
          size: 80,
          color: EColors.white,
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(width),
          bottomRight: Radius.circular(width),
        ),
        child: Image.asset(
          'assets/images/burgers.png',
          width: width,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const InvalidImage(),
        ),
      ),
    );
  }
}
