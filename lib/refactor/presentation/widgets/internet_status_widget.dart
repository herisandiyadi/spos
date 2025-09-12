import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/internet_controller.dart';

/// Widget to display online/offline status using InternetController (GetX)
class InternetStatusWidget extends StatelessWidget {
  final InternetController controller;

  /// Optionally allow passing a custom controller, otherwise use Get.find
  InternetStatusWidget({Key? key, InternetController? controller})
      : controller = controller ?? Get.find<InternetController>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isOnline = controller.isConnected.value;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          isOnline ? '🟢' : '🔴',
          style: TextStyle(
            color: isOnline ? Colors.green[700] : Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    });
  }
}
