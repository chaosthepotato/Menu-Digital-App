import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final List<IconData> items;
  final Function(int) onTap;
  final int initialActiveIndex;

  const Navbar({
    Key? key,
    required this.items,
    required this.onTap,
    this.initialActiveIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: EColors.orangePrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(
          items.length,
          (index) {
            return Expanded(
              child: InkWell(
                onTap: () => onTap.call(index),
                child: Icon(items[index], color: EColors.white, size: 32),
              ),
            );
          },
        ),
      ),
    );
  }
}
