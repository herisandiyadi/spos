import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_bluetooth.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class BluetoothConnection extends StatelessWidget {
  BluetoothConnection({super.key});

  final _bluetoothController = Get.find<BluetoothController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        vertical: size.height / 6,
        horizontal: size.width / 5,
      ),
      content: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Obx(() {
          final state = _bluetoothController.status.value;

          if (state.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      strokeCap: StrokeCap.round,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    _bluetoothController.information.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumGothic',
                      color: customBodyText,
                    ),
                  )
                ],
              ),
            );
          }

          if (state.isError) {
            return Center(
              child: Text(
                state.errorMessage ?? '---',
                style: TextStyle(
                  fontFamily: 'NanumGothic',
                  color: customBodyText,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Obx(() {
                if (_bluetoothController.bluetoothEnabled.value) {
                  final data = _bluetoothController.bluetoothList;
                  // print(data);
                  if (data.isEmpty) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/errors/box-empty.webp",
                              width: size.height * 0.2, fit: BoxFit.cover),
                          const SizedBox(height: 10),
                          Text(
                            "No paired Bluetooth devices found.",
                            style: TextStyle(
                              fontFamily: 'NanumGothic',
                              color: customBodyText,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final device = data[index];

                        return Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                device.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "UbuntuBold",
                                  color: primaryColor,
                                ),
                              ),
                              subtitle: Text(
                                device.macAdress,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "NanumGothic",
                                  color: customHeadingText,
                                ),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () async {
                                  if (_bluetoothController
                                          .connectedPrinter.value ==
                                      device.macAdress) {
                                    _bluetoothController.testPrint();
                                  } else {
                                    await _bluetoothController.connectPrinter(
                                        macAddress: device.macAdress);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: const Size(130, 40),
                                  backgroundColor: _bluetoothController
                                              .connectedPrinter.value ==
                                          device.macAdress
                                      ? customGreen
                                      : primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  _bluetoothController.connectedPrinter.value ==
                                          device.macAdress
                                      ? 'Test Print'
                                      : 'Set Primary',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "UbuntuBold",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: Text(
                      "No device found. Please turn on Bluetooth.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'NanumGothic',
                      ),
                    ),
                  );
                }
              })),
            ],
          );
        }),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return _bluetoothController.connectedPrinter.value.isNotEmpty
                  ? SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80, 40),
                          foregroundColor: Colors.white,
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () async {
                          await _bluetoothController.disconnectPrinter();
                        },
                        child: const Text(
                          'Disconnect All',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'UbuntuBold',
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
            SizedBox(width: 10.w),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () => Get.back(),
                child: const Text(
                  'Close',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'UbuntuBold',
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
