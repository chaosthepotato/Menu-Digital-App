import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/bases/widgets/atoms/home_divider.dart';
import '../../../../core/themes/e_colors.dart';
import '../../../controllers/restaurant_controller.dart';
import '../../category/card/category_card.dart';
import '../card/home_resto_card.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final RestaurantController controller = Get.find();

  // Scroll controller for Categories
  late ScrollController _cController;
  double cPadding = 0;

  // Scroll controller for Near Restaurants
  late ScrollController _rController;
  double rPadding = 0;

  // Scroll controller for Recommended Restaurants
  late ScrollController _rrController;
  double rrPadding = 0;

  @override
  void initState() {
    super.initState();
    _rrController = ScrollController();
    _rController = ScrollController();
    _cController = ScrollController();
    _cController.addListener(() {
      setState(() {
        cPadding = scrollListener(_cController);
      });
    });
    _rController.addListener(() {
      setState(() {
        rPadding = scrollListener(_rController);
      });
    });
    _rrController.addListener(() {
      setState(() {
        rrPadding = scrollListener(_rrController);
      });
    });
  }

  double scrollListener(ScrollController controller) {
    if (controller.offset < 0) {
      return 0;
    } else {
      return (Get.width - (Get.width / 6) - 40) *
          (controller.offset / controller.position.maxScrollExtent);
    }
  }

  @override
  void dispose() {
    _rrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: () async => controller.fetchRestaurant(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: cPadding),
                child: const HomeDivider(),
              ),
              // Categories
              SizedBox(
                height: context.width * 0.37 * 0.53 * 3.2,
                child: ListView.separated(
                    controller: _cController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: (controller.categories.length / 2.0).ceil(),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 20,
                        ),
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                        child: Column(
                          children: [
                            CategoryCard(
                                title: controller.categories.keys
                                    .elementAt(index * 2),
                                image: controller.categories.values
                                    .elementAt(index * 2)
                                    .first
                                    .restaurant_photo_url),
                            if (index * 2 + 1 < controller.categories.length)
                              CategoryCard(
                                title: controller.categories.keys
                                    .elementAt(index * 2 + 1),
                                image: controller.categories.values
                                    .elementAt(index * 2)
                                    .first
                                    .restaurant_photo_url,
                              ),
                          ],
                        ),
                      );
                    }),
              ),
              // Near Restaurants
              Container(
                color: EColors.white,
                width: context.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Text(
                  'Restaurants Near You',
                  style: EColors.black.w700.s16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: rPadding),
                child: const HomeDivider(),
              ),
              SizedBox(
                height: context.width * 0.33 * 1.2,
                child: ListView.separated(
                    controller: _rController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.restaurant?.length ?? 0,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                        child: HomeRestoCard(
                          restaurant: controller.restaurant![index],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Container(
                color: EColors.white,
                width: context.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Text(
                  'Recommended Restaurants',
                  style: EColors.black.w700.s16,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: rrPadding),
                child: const HomeDivider(),
              ),
              SizedBox(
                height: context.width * 0.33 * 1.2,
                child: ListView.separated(
                    controller: _rrController,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.restaurant?.length ?? 0,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                        child: HomeRestoCard(
                          restaurant: controller.restaurant![index],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
