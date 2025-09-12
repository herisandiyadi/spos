import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auto_print_controller.dart';

class AutoPrintDialog extends StatelessWidget {
  const AutoPrintDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AutoPrintController>();

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Center(
          child: Text('Auto Print',
              style: TextStyle(fontWeight: FontWeight.bold))),
      content: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('OFF', style: TextStyle(fontWeight: FontWeight.bold)),
              Switch(
                value: controller.isAutoPrint.value,
                onChanged: (val) => controller.setAutoPrint(val),
              ),
              const Text('ON', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Tutup'),
        ),
      ],
    );
  }
}
