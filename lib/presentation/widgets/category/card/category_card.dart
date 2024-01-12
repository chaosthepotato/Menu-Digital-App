import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/presentation/controllers/search_resto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/themes/e_colors.dart';
import '../category_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final SearchRestoController sController = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () => Get.to(() => CategoryPage(category: title))!
                .then((value) => sController.setIsSearching(false)),
            child: Container(
              width: context.width * 0.37,
              height: context.width * 0.37 * 0.53,
              color: EColors.white,
              child: Image.network(image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const InvalidImage()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: EColors.black.w400.s14),
        ),
      ],
    );
  }
}
