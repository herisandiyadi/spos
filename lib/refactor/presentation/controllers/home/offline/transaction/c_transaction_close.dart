import 'package:get/get.dart';
import 'package:recase/recase.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class TransactionCloseController extends GetxController {
  final dbHelper = DatabaseHelper();
  
  final transactionClose = <TransactionLiteModel>[].obs;

  var status = RxStatus.empty().obs;

  Future<void> fetchTransactionClose() async {
    status.value = RxStatus.loading();

    await Future.delayed(const Duration(seconds: 1));

    try {
      final now = DateTime.now();
      final weekAgo = now.subtract(const Duration(days: 6));

      final startDate = DateFormatter.format(date: weekAgo, pattern: DateFormatter.isoDate);
      final endDate = DateFormatter.format(date: now, pattern: DateFormatter.isoDate);

      final result = await dbHelper.getTransactionByDateStatus(startDate: startDate, endDate: endDate, status: TransactionFilter.close.name.titleCase);
      final parsed = result.map((e) => TransactionLiteModel.fromJson(e)).toList();

      transactionClose.assignAll(parsed);

      status.value = RxStatus.success();
    } catch(e) {
      status.value = RxStatus.error(e.toString());
    }
  }
}