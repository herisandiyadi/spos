import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class ChangeTableConfirm extends StatelessWidget {
  ChangeTableConfirm({required this.tableId, required  this.trx, super.key});

  final int tableId;
  final String trx;
  final _orderOfflineController = Get.find<OrderOfflineController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Change Table Confirmation'),
      content: const Text(
        'Are you sure you want to change the table? Any ongoing orders may be affected.',
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await _orderOfflineController.changeTable(tableId: tableId, trx: trx);

            Get.back();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white
          ),
          child: const Text('Continue'),
        ),
      ],
    );
  }
}