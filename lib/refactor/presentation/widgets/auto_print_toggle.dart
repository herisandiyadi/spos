import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auto_print_controller.dart';

class AutoPrintToggle extends StatelessWidget {
  const AutoPrintToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AutoPrintController>();

    return Obx(() => SwitchListTile(
          title: const Text('Auto Print'),
          value: controller.isAutoPrint.value,
          onChanged: (val) => controller.setAutoPrint(val),
        ));
  }
}
