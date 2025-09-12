import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_send_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/widgets/internet_status_widget.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

PreferredSizeWidget buildCustomAppBar(
    {required VoidCallback onRefresh, required VoidCallback onSyncPressed}) {
  final topNavigationController = Get.find<TopNavigationController>();
  final sendDataController = Get.find<SendDataController>();
  final screenLockController = Get.find<ScreenLockController>();

  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: primaryColor,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/logoTextVert.png",
            height: 30, fit: BoxFit.cover),
        Obx(() {
          final name = topNavigationController.outletName.value;
          return Text(
            " | $name",
            style: const TextStyle(
              fontSize: 21,
              fontFamily: "UbuntuBold",
              color: Colors.white,
            ),
          );
        }),
      ],
    ),
    actions: [
      InternetStatusWidget(),
      IconButton(
        icon: const Icon(Icons.refresh_outlined, color: Colors.white),
        onPressed: onRefresh,
      ),
      Obx(() {
        final data = sendDataController.transactionCloseList;
        print(data);
        return badges.Badge(
          showBadge: data.isNotEmpty,
          position: badges.BadgePosition.topStart(top: 4, start: 4),
          badgeStyle: const badges.BadgeStyle(
            elevation: 0,
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.red,
            padding: EdgeInsets.all(6),
            borderSide: BorderSide(width: 1.5, color: Colors.white),
          ),
          badgeContent: Text(
            data.length.toString(),
            style: const TextStyle(
              fontSize: 12.0,
              fontFamily: "NanumGothic",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          child: IconButton(
            onPressed: onSyncPressed,
            icon: const Icon(Icons.view_list_sharp, color: Colors.white),
          ),
        );
      }),
      Obx(() {
        final status = screenLockController.isLockScreen.value;

        return PopupMenuButton<String>(
          color: customLightGrey,
          offset: const Offset(0, 40),
          padding: EdgeInsets.zero,
          menuPadding: EdgeInsets.zero,
          icon: const Icon(Icons.settings, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onSelected: (value) {
            topNavigationController.handleMenuSelection(value);
          },
          itemBuilder: (context) => [
            if (!status)
              _buildPopupItem(
                  value: 'pos', icon: Icons.monitor, label: 'Point of Sale'),
            if (!topNavigationController.isWaiters.value && !status)
              _buildPopupItem(
                  value: 'report', icon: Icons.newspaper, label: 'Report'),
            _buildPopupItem(
                value: 'printBluetooth',
                icon: Icons.print,
                label: 'Print Bluetooth'),
            _buildPopupItem(
                value: 'printLan',
                icon: Icons.print,
                label: 'Print Lan (Network)'),
            _buildPopupItem(
                value: 'autoPrint', icon: Icons.print, label: 'Auto Print'),
            if (!status)
              _buildPopupItem(value: 'log', icon: Icons.report, label: 'Log'),
            if (!status)
              _buildPopupItem(
                  value: 'senddb',
                  icon: Icons.car_repair,
                  label: 'Troubleshoot Apps'),
            _buildPopupItem(
                value: 'logout',
                icon: Icons.power_settings_new_rounded,
                label: 'System Logout'),
          ],
        );
      }),
      Obx(() {
        final status = screenLockController.isLockScreen.value;

        return !status
            ? IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () => screenLockController.lockSession(),
              )
            : const SizedBox.shrink();
      })
    ],
  );
}

PopupMenuItem<String> _buildPopupItem(
    {required String value, required IconData icon, required String label}) {
  return PopupMenuItem<String>(
    value: value,
    child: Row(
      children: [
        Icon(icon, color: customHeadingText),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(fontFamily: "UbuntuBold", color: customHeadingText),
        ),
      ],
    ),
  );
}
