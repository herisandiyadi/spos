import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/request/c_create_transaction_sm.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/presentation/screens/component_top_nav/component_home/component_reserve_list/popup_create_customer.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class PopupCreateOrder extends StatelessWidget {
  PopupCreateOrder(
      {super.key,
      this.tableId,
      this.tableLabel,
      this.tableNumber,
      required this.tableStatus,
      required this.type,
      this.transactionNumber});

  final int? tableId;
  final String? tableLabel;
  final int? tableNumber;
  final bool tableStatus;
  final int type;
  final String? transactionNumber;

  final createTransactionSMController =
      Get.find<CreateTransactionSMController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (tableLabel ?? '').isNotEmpty ? "Table $tableLabel" : "New Order",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'UbuntuBold',
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                if (tableStatus) {
                  Get.back();

                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return PopupCreateCustomer(
                            id: tableId ?? 0,
                            label: tableLabel ?? '',
                            type: type);
                      });
                } else {
                  Get.toNamed(
                    RouteName.orderOffline,
                    arguments: {
                      "order_type": offline,
                      "transaction_number": transactionNumber,
                    },
                  );
                }
              },
              child: Card(
                color: primaryColor,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: ListTile(
                  leading: Icon(Icons.person_add_alt_1, color: Colors.white),
                  title: Text(
                    tableStatus ? "Start Order" : "Continue Order",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () async {
                await createTransactionSMController.createTransactionSM(
                    tableId: tableId ?? 0,
                    tableLabel: tableLabel ?? '',
                    tableNumber: tableNumber ?? 0,
                    init: true);
                Get.back();
              },
              child: Card(
                color: primaryColor,
                margin: EdgeInsets.symmetric(vertical: 5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: ListTile(
                  leading: Icon(Icons.print_rounded, color: Colors.white),
                  title: Text(
                    "Print QR Code",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
