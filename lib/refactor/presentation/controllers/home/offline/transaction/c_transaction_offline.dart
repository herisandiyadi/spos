import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class TransactionOfflineController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final dbHelper = DatabaseHelper();

  late TabController tabController;

  final transactionOpen = <TransactionLiteModel>[].obs;
  final transactionClose = <TransactionLiteModel>[].obs;

  RxInt currentTabIndex = 0.obs;
  RxInt totalAll = 0.obs;
  RxInt totalOpen = 0.obs;
  RxInt totalClose = 0.obs;

  var status = RxStatus.empty().obs;

  void selectTab({required int index}) {
    currentTabIndex.value = index;
  }

  Future<void> countTransaction() async {
    final now = DateTime.now();
    final weekAgo = now.subtract(const Duration(days: 6));

    final startDate =
        DateFormatter.format(date: weekAgo, pattern: DateFormatter.isoDate);
    final endDate =
        DateFormatter.format(date: now, pattern: DateFormatter.isoDate);

    // :: Transaction All
    final result1 = await dbHelper.getTransactionByDate(
        startDate: startDate, endDate: endDate);
    final parsedData1 =
        result1.map((e) => TransactionLiteModel.fromJson(e)).toList();
    // :: Transaction Open
    final result2 = await dbHelper.getTransactionByDateStatus(
        startDate: startDate,
        endDate: endDate,
        status: TransactionFilter.open.name.titleCase);
    final parsedData2 =
        result2.map((e) => TransactionLiteModel.fromJson(e)).toList();
    // :: Transaction Close
    final result3 = await dbHelper.getTransactionByDateStatus(
        startDate: startDate,
        endDate: endDate,
        status: TransactionFilter.close.name.titleCase);
    final parsedData3 =
        result3.map((e) => TransactionLiteModel.fromJson(e)).toList();

    totalAll.value = parsedData1.length;
    totalOpen.value = parsedData2.length;
    totalClose.value = parsedData3.length;
  }

  @override
  void onInit() {
    super.onInit();

    countTransaction();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }
}
