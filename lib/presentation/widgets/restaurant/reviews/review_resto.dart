import 'package:e_menu_app/core/bases/widgets/atoms/filter_tag.dart';
import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:e_menu_app/presentation/controllers/restaurant_controller.dart';
import 'package:e_menu_app/presentation/widgets/restaurant/card/review_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Review section on Restaurant Page
class ReviewResto extends StatelessWidget {
  const ReviewResto({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final RestaurantController controller = Get.find()
      ..fetchReview(restaurant.id);
    return Obx(
      () => Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(
                  restaurant.name,
                  style: EColors.black.w700.s20,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 128,
                  child: FilterTag(
                      name: 'Highest rating ',
                      icon: Icons.thumb_up_alt_outlined),
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: controller.isFetching,
                  child: Padding(
                    padding: EdgeInsets.only(top: context.height / 5),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                ),
                Visibility(
                  visible: !controller.isFetching && controller.review!.isEmpty,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: context.height / 5),
                      child: const Center(
                        child: Text('No review yet'),
                      ),
                    ),
                  ),
                ),
              ] +
              List.generate(
                controller.review!.length,
                (index) => Column(
                  children: [
                    ReviewCard(review: controller.review![index]),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
