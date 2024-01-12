import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';

import 'package:e_menu_app/presentation/widgets/resto_dashboard/cards/resto_menu_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/order/menu_order_model.dart';
import '../../../controllers/resto_wrapper_controller.dart';

class RestoMenuPage extends StatefulWidget {
  const RestoMenuPage({
    super.key,
    required this.menus,
    required this.tableId,
    required this.restoId,
  });

  final List<MenuOrderModel> menus;
  final int tableId;
  final String restoId;

  @override
  State<RestoMenuPage> createState() => _RestoMenuPageState();
}

class _RestoMenuPageState extends State<RestoMenuPage> {
  final List<bool> _value = <bool>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.menus.length; i++) {
      _value.add(widget.menus[i].status.toLowerCase().contains('serve'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final RestoWrapperController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders', style: EColors.black.w700.s24),
      ),
      body: ListView.builder(
        itemCount: widget.menus.length,
        itemBuilder: (context, index) {
          return RestoMenuCard(
            name: widget.menus[index].name,
            tableId: widget.tableId,
            status: _value[index] ? 'Served' : widget.menus[index].status,
            image: widget.menus[index].menu_photo_url,
            value: _value[index],
            onTap: () async {
              if (_value[index]) {
                return;
              }
              if (widget.menus[index].status.toLowerCase().contains('serve')) {
                return;
              }

              final isUpdated = await controller.updateOrderStatus(
                  widget.restoId,
                  widget.menus[index].order_id!,
                  widget.menus[index].menu_id?.toString() ?? '1');

              if (isUpdated) {
                setState(() {
                  _value[index] = !_value[index];
                });
              }
            },
          );
        },
      ),
    );
  }
}
