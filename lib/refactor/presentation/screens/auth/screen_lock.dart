import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_printer.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_send_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_sync_data.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_app_bar.dart';
import 'package:squadra_pos/refactor/utils/custom_bottom_bar.dart';

class ScreenLockPage extends StatelessWidget {
  ScreenLockPage({super.key});

  final localStorage = Get.find<LocalStorage>();
  final printerController = Get.find<PrinterController>();
  final sendDataController = Get.find<SendDataController>();
  final syncDataController = Get.find<SyncDataController>();
  final screenLockController = Get.find<ScreenLockController>();
  final topNavigationController = Get.find<TopNavigationController>();

  // getDeviceInfo();

  @override
  Widget build(BuildContext context) {
    debugPrint("presentation>screens>auth>screen_lock page");
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
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Obx(() {
                    final state = topNavigationController.status.value;

                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 8,
                          strokeCap: StrokeCap.round,
                        ),
                      );
                    }

                    final path = topNavigationController.outletImagePath.value;

                    return File(path).existsSync()
                        ? Image.file(File(path), width: 200.w)
                        : Image.asset("assets/images/logoText.png", scale: 2);
                  }),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                color: customWhite2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Obx(() {
                          final name = topNavigationController.outletName.value;

                          return Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Obx(() {
                            final data = screenLockController.staffPIN;

                            return CircleAvatar(
                              radius: 10,
                              backgroundColor: index < data.length
                                  ? screenLockController.isWrongPin.value
                                      ? customRed1
                                      : primaryColor
                                  : Colors.grey.shade300,
                            );
                          }),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      final state = screenLockController.status.value;

                      if (state.isError) {
                        return Text(
                          state.errorMessage ?? '',
                          style: TextStyle(
                            color: customRed1,
                            fontFamily: "UbuntuBold",
                          ),
                        );
                      }

                      return const SizedBox.shrink();
                    }),
                    const SizedBox(height: 40),
                    GridView.builder(
                      itemCount: 12,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.3,
                      ),
                      itemBuilder: (context, index) {
                        if (index == 9) {
                          return Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () => screenLockController.deletePin(),
                              icon: Icon(Icons.backspace_outlined, size: 20.sp),
                            ),
                          );
                        } else if (index == 11) {
                          return InkWell(
                            onTap: () => screenLockController.unlockScreen(
                                screenLockController.staffPIN.join()),
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Icon(Icons.check,
                                  size: 20.sp, color: Colors.white),
                            ),
                          );
                        } else {
                          String pin = index == 10 ? "0" : "${index + 1}";

                          return GestureDetector(
                            onTap: () =>
                                screenLockController.addPin(number: pin),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                pin,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontFamily: "UbuntuBold",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
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
