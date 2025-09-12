import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class SMReprintBill extends StatelessWidget {
  SMReprintBill({super.key});

  final dbHelper = DatabaseHelper();
  final localStorage = Get.find<LocalStorage>();
  final transactionOrderSMController = Get.find<TransactionOrderSMController>();
  final transactionDetailSMController =
      Get.find<TransactionDetailSMController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: customBlue1,
        ),
      ),
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      insetPadding: const EdgeInsets.all(15),
      contentPadding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      content: SingleChildScrollView(
        child: Center(
          child: Text(
            "Resend Order ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: customHeadingText,
              fontSize: 14.sp,
              fontFamily: "NanumGothic",
            ),
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(80, 45),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                side: BorderSide(
                  width: 2,
                  color: customRegularGrey,
                ),
              ),
              onPressed: () => Get.back(),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size(80, 45),
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final primary = await localStorage.getPrimaryPrinter();

                final result = await dbHelper.getStation();
                final station = result
                    .map((model) => StationLiteModel.fromJson(model))
                    .toList();

                // for (var location in station) {
                //   String printer = prefs.getString(location.stationName) ?? "";

                if (primary[0] == 'BluetoothPrinter') {
                } else {
                  // printDocketLan(0, transactionNumberFinal, primary[1], location.stationID, location.stationName, tableLabel);
                }

                // }
              },
              child: Text(
                "Send",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
