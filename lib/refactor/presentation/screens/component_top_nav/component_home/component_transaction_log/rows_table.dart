import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/transaction/c_transaction_all.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
// import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_top_navigation.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class RowsTable extends StatelessWidget {
  const RowsTable(
      {required this.data,
      required this.category,
      required this.ipAddress,
      required this.deviceName,
      required this.staffPin,
      super.key});
  final RxList<dynamic> data;
  final String category;
  final String ipAddress;
  final String deviceName;
  final String staffPin;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Table(
        columnWidths: {
          6: FixedColumnWidth(150.r),
          7: FixedColumnWidth(200.r),
        },
        children: [
          ...data.asMap().entries.map((entry) {
            var index = entry.key;
            var response = entry.value;

            return TableRow(
              decoration: BoxDecoration(
                color: index % 2 == 0 ? customWhite3 : Colors.white,
              ),
              children:
                  buildTransactionCells(data: response, category: category),
            );
          }),
        ],
      );
    });
  }

  List<TableCell> buildTransactionCells(
      {required dynamic data, required String category}) {
    return [
      _tableTextCell(data.datetime?.toString() ?? "---"),
      _tableTextCell(data.transactionNumber?.toString() ?? "---"),
      _tableTextCell(
          "${data.transactionType ?? '---'} ${data.tableLabel ?? ''}"),
      _tableTextCell(data.customerName?.toString() ?? "---"),
      _tableTextCell(numberFormat(
              'IDR', category == "offline" ? data.subTotal : data.subTotal)
          .toString()),
      _tableTextCell(numberFormat(
              'IDR',
              category == "offline"
                  ? data.grandTotalFinal
                  : data.grandTotalFinal)
          .toString()),
      _statusCell(data.statusTransaction ?? '---'),
      _actionCell(data, category),
    ];
  }

  TableCell _tableTextCell(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: 'NanumGothic',
            color: customHeadingText,
          ),
        ),
      ),
    );
  }

  TableCell _statusCell(String status) {
    final isClosed = status == TransactionFilter.close.name.titleCase;
    final isVoid = status == 'Void';
    final isCancel = status == 'Cancel';

    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          status,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.sp,
            fontFamily: isClosed ? 'NanumGothic' : 'UbuntuBold',
            color: (isClosed
                ? customHeadingText
                : isVoid
                    ? Colors.red
                    : isCancel
                        ? Colors.amber
                        : primaryColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  TableCell _actionCell(dynamic data, String category) {
    final topNavigationController = Get.find<TopNavigationController>();
    final _dbHelper = DatabaseHelper();
    final _transactionAllController = Get.find<TransactionAllController>();
    // final arguments = Get.arguments;
    // print(topNavigationController.isAdmin.value);
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ICON RECEIPT
            InkWell(
              onTap: () {
                if (category == offline) {
                  if (data.statusTransaction ==
                          TransactionFilter.close.name.titleCase ||
                      data.statusTransaction == 'Void') {
                    Get.toNamed(RouteName.successPaymentOffline, arguments: {
                      "refresh": false,
                      "transaction_number": data.transactionNumber,
                    });
                  } else if (data.statusTransaction != 'Cancel') {
                    Get.toNamed(RouteName.orderOffline, arguments: {
                      "order_type": offline,
                      "table_id": data.tableID,
                      "transaction_number": data.transactionNumber,
                    });
                  }
                } else {
                  Get.toNamed(RouteName.orderSM, arguments: {
                    "unique_number": data.uniqeNumber,
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(Icons.receipt, size: 16.sp, color: primaryColor),
              ),
            ),

            SizedBox(width: 8),

            // BUTTON VOID
            SizedBox(
              height: 52.h,
              width: 52.h, // opsional: bikin kotak
              child: InkWell(
                onTap: !topNavigationController.isAdmin.value ||
                        data.statusTransaction == 'Void' ||
                        data.statusTransaction == 'Cancel'
                    ? null
                    : () {
                        Get.defaultDialog(
                          title: "Confirmation",
                          middleText:
                              "Are you sure you want to void this transaction?",
                          textConfirm: "Yes",
                          textCancel: "No",
                          confirmTextColor: Colors.white,
                          onConfirm: () async {
                            await _dbHelper
                                .updateTransactionVoid(data.transactionNumber);

                            final activityDesc =
                                "Void Transaction : ${data.transactionNumber}";
                            final dateTime = DateFormatter.format(
                                date: DateTime.now(),
                                pattern: DateFormatter.fullDateTime);

                            await _dbHelper.insertLogActLite(
                                dateTime,
                                data.transactionNumber,
                                deviceName,
                                activityDesc,
                                ipAddress,
                                "VOID",
                                int.parse(staffPin),
                                "system");
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            Get.toNamed(RouteName.topNavigation);
                            Get.back();
                            await _transactionAllController
                                .fetchTransactionAll();
                          },
                        );
                      },
                borderRadius:
                    BorderRadius.circular(6), // biar efek ripple-nya bulat
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: topNavigationController.isAdmin.value &&
                              data.statusTransaction != 'Void' &&
                              data.statusTransaction != 'Cancel'
                          ? Colors.red
                          : customRegularGrey,
                    ),
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.transparent,
                  ),
                  child: Icon(Icons.delete,
                      size: 16.sp,
                      color: topNavigationController.isAdmin.value &&
                              data.statusTransaction != 'Void' &&
                              data.statusTransaction != 'Cancel'
                          ? Colors.red
                          : customRegularGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
