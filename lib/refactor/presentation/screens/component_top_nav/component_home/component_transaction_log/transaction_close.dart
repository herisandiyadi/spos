import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_home.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_close.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/rows_table.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/header_table.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_transaction_log/loader_table.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class TransactionClose extends StatefulWidget {
  const TransactionClose({super.key});

  @override
  State<TransactionClose> createState() => _TransactionCloseState();
}

class _TransactionCloseState extends State<TransactionClose>
    with AutomaticKeepAliveClientMixin {
  final _homeController = Get.find<HomeController>();
  final _transactionCloseController = Get.find<TransactionCloseController>();
  String ipAddress = '';
  String deviceName = '';
  String staffpin = '';
  late LocalStorage localStorage = LocalStorage();
  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    getDeviceInfo();
    if (args != null && args['refresh'] == true) {
      _transactionCloseController.fetchTransactionClose();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _transactionCloseController.fetchTransactionClose();
    });
  }

  Future<void> getDeviceInfo() async {
    final info = NetworkInfo();
    final deviceInfoPlugin = DeviceInfoPlugin();

    // Ambil IP Address
    String? ip = await info.getWifiIP();

    // Ambil Device Name
    String? name;
    if (Platform.isAndroid) {
      var androidInfo = await deviceInfoPlugin.androidInfo;
      name = "${androidInfo.manufacturer} ${androidInfo.model}";
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfoPlugin.iosInfo;
      name = iosInfo.name; // Nama device iPhone/iPad
    } else {
      name = "Unknown Device";
    }
    staffpin = await localStorage.getStaffPinId();
    setState(() {
      ipAddress = ip ?? 'Tidak terdeteksi';
      deviceName = name ?? 'Tidak terdeteksi';
      staffpin = staffpin;
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.fromLTRB(30.r, 10.r, 30.r, 50.r),
      color: customBackground,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: OutlinedButton(
                onPressed: () async =>
                    await _transactionCloseController.fetchTransactionClose(),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  foregroundColor: primaryColor,
                  minimumSize: const Size(0.0, 35),
                  side: BorderSide(
                    width: 1,
                    color: primaryColor,
                  ), // Border color dan width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh),
                    const SizedBox(width: 8.0),
                    Text(
                      "Refresh",
                      style: const TextStyle(
                        fontFamily: "UbuntuBold",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // :: Table
          HeaderTable(),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: customRegularGrey,
                    ),
                    right: BorderSide(
                      width: 1,
                      color: customRegularGrey,
                    ),
                    bottom: BorderSide(
                      width: 1,
                      color: customRegularGrey,
                    ),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                  child: Obx(() {
                    final state = _transactionCloseController.status.value;

                    if (state.isLoading) return LoaderTable();
                    if (state.isError) return Container();

                    final offlineData =
                        _transactionCloseController.transactionClose;

                    return offlineData.isEmpty
                        ? Container(
                            width: size.width,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 40.dm),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      "assets/images/errors/data-empty.png",
                                      width: size.height * 0.25,
                                      fit: BoxFit.cover),
                                  const Text(
                                    "No Bill Are Listed Yet",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: "NanumGothic",
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 0, 16, 16),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 13,
                                        ),
                                        minimumSize: const Size(100, 0),
                                        elevation: 0,
                                        backgroundColor: primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        side: BorderSide(
                                          width: 2,
                                          color: primaryColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          _homeController.toggleTableView(0),
                                      child: Text(
                                        "New Order ?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'UbuntuBold',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : RowsTable(
                            data: offlineData,
                            category: offline,
                            ipAddress: ipAddress,
                            deviceName: deviceName,
                            staffPin: staffpin);
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
