import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu/m_transaction_sm.dart';
// import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
// import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';

class TransactionHeaderSMController extends GetxController {
  TransactionHeaderSMController(this.transactionSMRepository);

  final SMenuRepository transactionSMRepository;
  final dbHelper = DatabaseHelper();
  final transactionSMList = <TransactionSMData>[].obs;

  RxInt totalTransaction = 0.obs;
  bool isRunning = false;
  var status = RxStatus.empty().obs;
  // Sudah pernah diprint per TransactionNumber
  final printedTransactions = <String>{}.obs;

// CartDetailID yang sudah pernah diprint
  final printedDetails = <String>{}.obs;
  final Map<String, Map<String, dynamic>> groupedTransactions = {};
  Timer? _timer;

  Future<void> countTransactionHeaderSMCall() async {
    ApiResult result = await transactionSMRepository.getTransactionSM();

    result.when(
      success: (data, url, headers, statusCode) {
        final response = transactionSMFromJson(data);

        final items = response?.data ?? [];

        totalTransaction.value = items.length;
      },
      error: (data, url, headers, statusCode) async {
        final response = transactionSMFromJson(data);
        final message = response?.status ?? '';

        debugPrint("Error count transaction log smenu: $message");
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        debugPrint(
            "Error count transaction log smenu: ${response["error_type"]}");
      },
    );
  }

  // Future<void> getTransactionHeaderSMCall({bool cron = false}) async {
  //   if (isRunning) return; // cegah overlap
  //   isRunning = true;
  //   try {
  //     final transactionSMOrderController =
  //         Get.find<TransactionOrderSMController>();
  //     if (!cron) status.value = RxStatus.loading();
  //     await Future.delayed(const Duration(seconds: 1));

  //     ApiResult result = await transactionSMRepository.getTransactionSM();

  //     result.when(
  //       success: (data, url, headers, statusCode) async {
  //         final Map<String, dynamic> decoded = jsonDecode(data);

  //         // Ambil list data dari key 'data'
  //         final List<dynamic> dataList = decoded['data'] ?? [];

  //         //convert ke model trannsaction
  //         decoded['data'] = cleanCartList(dataList, 1);
  //         final cleanedJson = jsonEncode(decoded);
  //         final response = transactionSMFromJson(cleanedJson);

  //         //update ke model trannsaction
  //         final items = response?.data ?? [];
  //         transactionSMList.value = items;

  //         // final result = await dbHelper.getStation();
  //         // final stations =
  //         //     result.map((model) => StationLiteModel.fromJson(model)).toList();

  //         final cleanedUnprinted = cleanCartList(dataList, 0);
  //         final Map<String, Map<String, dynamic>> groupedTransactions = {};

  //         final List<dynamic> details = [];
  //         for (final item in cleanedUnprinted) {
  //           final transNum = item['TransactionNumber'].toString();
  //           final tableLabel = item['TableLabel'];
  //           final List<dynamic> details = item['details'] ?? [];

  //           // filter detail yang belum diprint
  //           final newDetails = details.where((d) {
  //             final detailId = d['CartDetailID'].toString();
  //             return !printedDetails.contains(detailId);
  //           }).toList();

  //           if (newDetails.isNotEmpty) {
  //             if (!groupedTransactions.containsKey(transNum)) {
  //               groupedTransactions[transNum] = {
  //                 'tableLabel': tableLabel,
  //                 'details': [],
  //               };
  //             }
  //             // gabungkan detail lama + baru
  //             groupedTransactions[transNum]!['details'].addAll(newDetails);
  //           }
  //         }
  //         print('TOTAL TRANSAKSI BARU: ${groupedTransactions.length}');

  //         for (final entry in groupedTransactions.entries) {
  //           final transNum = entry.key;
  //           final tableLabel = entry.value['tableLabel'];
  //           final List<dynamic> details = entry.value['details'];

  //           // final ids =
  //           //     details.map((d) => d['CartDetailID'].toString()).toList();
  //           // printedDetails.addAll(ids);

  //           // 🔑 Filter detail yang BELUM pernah diprint
  //           final unprintedDetails = details.where((d) {
  //             final id = d['CartDetailID'].toString();
  //             return !printedDetails.contains(id);
  //           }).toList();

  //           if (unprintedDetails.isEmpty) {
  //             debugPrint("✅ Semua item $transNum sudah diprint, skip");
  //             continue;
  //           }
  //           await transactionSMOrderController.printDocketsAuto(
  //             transNum,
  //             tableLabel,
  //             unprintedDetails,
  //           );

  //           // ✅ Tandai printed setelah print sukses
  //           printedDetails.addAll(
  //               unprintedDetails.map((d) => d['CartDetailID'].toString()));
  //         }

  //         status.value = RxStatus.success();
  //       },
  //       error: (data, url, headers, statusCode) async {
  //         final response = transactionSMFromJson(data);
  //         final message = response?.status ?? '';

  //         status.value = RxStatus.error(message);
  //       },
  //       failure: (exception) {
  //         final response = getContentErrorHTTP(exception);

  //         status.value = RxStatus.error(response["error_type"]);
  //       },
  //     );
  //   } finally {
  //     isRunning = false;
  //   }
  // }

  Future<void> getTransactionHeaderSMCall({bool cron = false}) async {
    if (isRunning) {
      debugPrint("⚠️ Skip - masih running");
      return;
    }
    isRunning = true;
    try {
      final transactionSMOrderController =
          Get.find<TransactionOrderSMController>();

      if (!cron) status.value = RxStatus.loading();
      await Future.delayed(const Duration(milliseconds: 500));

      ApiResult result = await transactionSMRepository.getTransactionSM();

      result.when(
        success: (data, url, headers, statusCode) async {
          final Map<String, dynamic> decoded = jsonDecode(data);
          final List<dynamic> dataList = decoded['data'] ?? [];

          // convert ke model
          decoded['data'] = cleanCartList(dataList, 1);
          final cleanedJson = jsonEncode(decoded);
          final response = transactionSMFromJson(cleanedJson);
          transactionSMList.value = response?.data ?? [];

          final cleanedUnprinted = cleanCartList(dataList, 0);
          final Map<String, Map<String, dynamic>> groupedTransactions = {};

          for (final item in cleanedUnprinted) {
            final transNum = item['TransactionNumber'].toString();
            final tableLabel = item['TableLabel'];
            final List<dynamic> details = item['details'] ?? [];

            // filter detail yang belum diprint
            final newDetails = details.where((d) {
              final id = d['CartDetailID'].toString();
              return !printedDetails.contains(id);
            }).toList();

            if (newDetails.isNotEmpty) {
              groupedTransactions.putIfAbsent(
                  transNum,
                  () => {
                        'tableLabel': tableLabel,
                        'details': [],
                      });
              groupedTransactions[transNum]!['details'].addAll(newDetails);
            }
          }

          debugPrint("🟢 TOTAL TRANSAKSI BARU: ${groupedTransactions.length}");

          for (final entry in groupedTransactions.entries) {
            final transNum = entry.key;
            final tableLabel = entry.value['tableLabel'];
            final List<dynamic> details = entry.value['details'];

            final ids =
                details.map((d) => d['CartDetailID'].toString()).toList();
            debugPrint("🆕 Akan diprint $transNum -> $ids");
            printedDetails.addAll(ids); // tandai sebelum print

            await transactionSMOrderController.printDocketsAuto(
              transNum,
              tableLabel,
              details,
            );
          }

          status.value = RxStatus.success();
        },
        error: (data, url, headers, statusCode) async {
          final response = transactionSMFromJson(data);
          status.value = RxStatus.error(response?.status ?? '');
        },
        failure: (exception) {
          final response = getContentErrorHTTP(exception);
          status.value = RxStatus.error(response["error_type"]);
        },
      );
    } finally {
      isRunning = false;
    }
  }

  List<Map<String, dynamic>> cleanCartList(
    List<dynamic> dataList,
    int? printKitchenFilter,
  ) {
    return dataList
        .map((item) {
          final mapItem = Map<String, dynamic>.from(item);

          // Hapus field tertentu
          mapItem.remove('CartID');

          // Jika ada details (nested), filter berdasarkan PrintKitchen
          if (printKitchenFilter != 1) {
            if (mapItem['details'] is List) {
              final details = (mapItem['details'] as List)
                  .where((d) =>
                      printKitchenFilter == null ||
                      (d['PrintKitchen'] ?? -1) == printKitchenFilter)
                  .toList();
              mapItem['details'] = details;
            } else {
              if (printKitchenFilter != null &&
                  (mapItem['PrintKitchen'] ?? -1) != printKitchenFilter) {
                return <String, dynamic>{}; // return map kosong
              }
            }
          } else {
            mapItem.remove('details');
          }
          return mapItem;
        })
        .where((mapItem) => mapItem.isNotEmpty)
        .toList()
        .cast<Map<String, dynamic>>();
  }

  void rebuild() async {
    await getTransactionHeaderSMCall();

    refresh();
  }

  @override
  void onInit() {
    super.onInit();
    // getTransactionHeaderSMCall();
    countTransactionHeaderSMCall();
    // _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
    //   getTransactionHeaderSMCall(cron: true);
    // });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
