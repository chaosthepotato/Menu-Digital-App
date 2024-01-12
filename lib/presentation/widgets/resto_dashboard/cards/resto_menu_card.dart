import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/bases/widgets/atoms/invalid_image.dart';
import '../../../../core/themes/e_colors.dart';

class RestoMenuCard extends StatelessWidget {
  const RestoMenuCard({
    required this.name,
    required this.tableId,
    required this.status,
    required this.image,
    required this.value,
    required this.onTap,
    super.key,
  });

  final String name;
  final int tableId;
  final String status;
  final String image;
  final bool value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: (val) => onTap(),
              ),
              const SizedBox(width: 10),
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const InvalidImage(),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: EColors.black.w700.s14,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Table No. $tableId',
                      style: EColors.greyPrimary.w400.s10,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              //button
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: EColors.orangePrimary,
                  border: Border.all(
                    color: EColors.orangePrimary,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: EColors.white.w700.s12,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: EColors.greyPrimary,
        ),
      ],
    );
  }
}
