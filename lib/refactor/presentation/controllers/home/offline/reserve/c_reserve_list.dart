import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_table/g_table.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu/m_transaction_sm.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';

class ReserveListController extends GetxController {
  ReserveListController(this._transactionSMRepository);

  final SMenuRepository _transactionSMRepository;

  final _dbHelper = DatabaseHelper();

  final reserveListMap = <int, List<TableLiteModel>>{}.obs;

  var status = RxStatus.empty().obs;

  Future<void> getTransactionLogSMCall({required int locationId}) async {
    status.value = RxStatus.loading();

    ApiResult result = await _transactionSMRepository.getTransactionSM();

    result.when(
      success: (data, url, headers, statusCode) async {
        final response = transactionSMFromJson(data);
        final items = response?.data ?? [];

        if (items.isNotEmpty) {
          final result = await _dbHelper.getTablesByLocation(locationId);
          final parsed = result.map<TableLiteModel>((json) => TableLiteModel.fromJson(json)).toList();

          for (var smenu in items) {
            int tableId = int.tryParse(smenu.tableID ?? '') ?? 0;

            if (tableId > 0) {
              final match = parsed.firstWhereOrNull((table) => table.tableID == tableId);
              if (match != null) {
                _dbHelper.updateUniqueNumberSM(
                  tableId,
                  smenu.uniqeNumber ?? 0,
                  smenu.datetime ?? '',
                );
              }
            }
          }

          await fetchTable(locationId: locationId);
        } else {
          await fetchTable(locationId: locationId);
        }
      },
      error: (data, url, headers, statusCode) async {
        final response = transactionSMFromJson(data);
        final message = response?.status ?? '';

        status.value = RxStatus.error(message);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> fetchTable({required int locationId}) async {
    try {
      final result = await _dbHelper.getTablesByLocation(locationId);
      final parsed = result.map<TableLiteModel>((json) => TableLiteModel.fromJson(json)).toList();

      reserveListMap[locationId] = parsed;

      status.value = RxStatus.success();
    } catch (e) {
      status.value = RxStatus.error("$e");
    }
  }
}