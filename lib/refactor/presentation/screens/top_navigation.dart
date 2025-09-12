import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_printer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/home.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/report_summary.dart';
import 'package:squadra_pos/refactor/utils/custom_app_bar.dart';
import 'package:squadra_pos/refactor/utils/custom_bottom_bar.dart';
import 'package:squadra_pos/report/log_page.dart';
import 'package:flutter/material.dart';
import 'package:squadra_pos/report/troubleshoot.dart';

class TopNavigationBar extends StatelessWidget {
  TopNavigationBar({super.key});

  final localStorage = Get.find<LocalStorage>();
  final signOutController = Get.find<SignOutController>();
  final printerController = Get.find<PrinterController>();
  final syncDataController = Get.find<SyncDataController>();
  final topNavigationController = Get.find<TopNavigationController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: buildCustomAppBar(
          onRefresh: () async {
            final firstSync = await localStorage.getFirstSync();

            syncDataController.syncSection(firstSync: firstSync);
          },
          onSyncPressed: () {},
        ),
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: topNavigationController.pageController,
              onPageChanged: (index) =>
                  topNavigationController.currentPageIndex.value = index,
              children: [
                HomePage(),
                SummaryPage(),
                LogPage(),
                Troubleshoot(),
                Container(),
              ],
            ),
            // isLoadingPrinter ? Container(
            //   color: Colors.black.withValues(alpha: 0.5),
            //   child: Center(
            //     child: CircularProgressIndicator(
            //       strokeCap: StrokeCap.round,
            //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            //     ),
            //   ),
            // ) : const SizedBox.shrink(),
          ],
        ),
        bottomNavigationBar: BottomInfoBar(
          printerLabel: printerController.label,
          versionNumber: topNavigationController.versionNumber,
        ),
      ),
    );
  }
}
