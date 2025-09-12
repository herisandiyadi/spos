import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_activity_pos/g_activity_pos.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_all/g_transaction_all.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_send_data.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class SendDataController extends GetxController {
  SendDataController(this._sendDataRepository);

  final SendDataRepository _sendDataRepository;

  final _dbHelper = DatabaseHelper();

  final transactionCloseList = <TransactionLiteAllModel>[].obs;
  final actPOSList = <ActPOSLiteModel>[].obs;
  final _sendingTransactions = <String>{}.obs;
  final _sendingLog = <int>{}.obs;

  Timer? _timer;
  bool _isTimerRunning = false;
  bool _isSending = false;

  Timer? _timerLOG;
  bool _isTimerRunningLOG = false;
  bool _isSendingLOG = false;

  @override
  void onInit() {
    super.onInit();
    _loadPendingTransactions();
    _loadActPOS();
  }

  Future<void> _loadActPOS() async {
    final today = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.isoDate);
    final resultACT = await _dbHelper.getLogActLite();

    if (resultACT.isEmpty) {
      //transactionCloseList.clear();
      _stopTimerLOG();
      return;
    }
    final logACT = resultACT.map(ActPOSLiteModel.fromJson).toList();

    actPOSList.assignAll(logACT);
    _startTimerLOG();
  }

  Future<void> _loadPendingTransactions() async {
    final today = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.isoDate);
    final result = await _dbHelper.getTransactionCloseAndVoid(
        startDate: today, endDate: today, statusSync: 0);

    if (result.isEmpty) {
      transactionCloseList.clear();
      _stopTimer();
      return;
    }

    final transactions = result.map(TransactionLiteAllModel.fromJson).toList();

    transactionCloseList.assignAll(transactions);

    debugPrint("Final transaction header: ${jsonEncode(transactions)}",
        wrapWidth: 1024);

    await _loadTransactionDetails();

    _startTimer();
  }

  Future<void> _loadTransactionDetails() async {
    for (var i = 0; i < transactionCloseList.length; i++) {
      final transaction = transactionCloseList[i];
      final details =
          await _getTransactionDetailLite(transaction.transactionNumber);

      transactionCloseList[i] = transaction.copyWith(details: details);
    }
  }

  Future<List<Detail>> _getTransactionDetailLite(
      String transactionNumber) async {
    final response = await _dbHelper.getTransactionDetailAll(
        transactionNumber: transactionNumber);
    final detailList = response.map(Detail.fromJson).toList();

    debugPrint("Final transaction detail: ${jsonEncode(detailList)}",
        wrapWidth: 1024);

    for (int i = 0; i < detailList.length; i++) {
      final addOn = await _dbHelper
          .getTransactionDetailAddOn(detailList[i].transactionDetailID);
      detailList[i] = detailList[i].copyWith(addOn: addOn);
    }

    return detailList;
  }

  void _startTimerLOG() {
    if (_isTimerRunningLOG || _timerLOG != null) return;

    _isTimerRunningLOG = true;
    _timerLOG =
        Timer.periodic(const Duration(seconds: 5), (_) => _processQueueLOG());
  }

  void _startTimer() {
    if (_isTimerRunning || _timer != null) return;

    _isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _processQueue());
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    _isTimerRunning = false;
  }

  void _stopTimerLOG() {
    _timerLOG?.cancel();
    _timerLOG = null;
    _isTimerRunningLOG = false;
  }

  Future<void> _processQueue() async {
    if (_isSending) return;
    _isSending = true;

    try {
      if (transactionCloseList.isEmpty) {
        _stopTimer();
        return;
      }

      final transaction = transactionCloseList.firstWhereOrNull(
        (t) => !_sendingTransactions.contains(t.transactionNumber),
      );

      if (transaction != null) {
        final txNumber = transaction.transactionNumber;

        if (!_sendingTransactions.add(txNumber)) {
          print("⏸ Already sending: $txNumber");
          return;
        }

        print("🚀 Start sending $txNumber");

        final currentAppVersion = await PackageInfo.fromPlatform();
        final transactionWithVersion =
            transaction.copyWith(appVersion: currentAppVersion.version);

        await _sendToCloud(transactionWithVersion);

        // Delay sedikit untuk pastikan tidak ada race
        await Future.delayed(const Duration(milliseconds: 200));
      }
    } finally {
      _isSending = false;
    }
  }

  Future<void> _processQueueLOG() async {
    if (_isSendingLOG) return;
    _isSendingLOG = true;
    // final resultACT = await _dbHelper.getLogActLite();
    try {
      if (actPOSList.isEmpty) {
        _stopTimerLOG();
        return;
      }

      final logACT = actPOSList.firstWhereOrNull(
        (t) => !_sendingLog.contains(t.logID),
      );
      if (logACT != null) {
        final logID = logACT.logID;

        if (!_sendingLog.add(logID)) {
          print("⏸ Already sending: $logID");
          return;
        }

        print("🚀 Start sending $logID");

        await _sendToCloudLOG(logACT);

        // Delay sedikit untuk pastikan tidak ada race
        await Future.delayed(const Duration(milliseconds: 200));
      }
    } finally {
      _isSendingLOG = false;
    }
  }

  Future<void> _sendToCloudLOG(ActPOSLiteModel resultACT) async {
    debugPrint("Send To Cloud: ${jsonEncode(resultACT)}", wrapWidth: 1024);
    final logID = resultACT.logID;
    try {
      await _ProcessLog(resultACT);
    } finally {
      await Future.delayed(const Duration(milliseconds: 500));
      _sendingLog.remove(logID);
      print("✅ Done sending $logID");
    }
  }

  Future<void> _ProcessLog(ActPOSLiteModel actPOS) async {
    final result =
        await _sendDataRepository.createActivityLog(body: actPOS.toJson());

    result.when(
      success: (data, _, __, ___) async {
        final res = json.decode(data);
        final status = res['status'] ?? 'failed';
        final msg = res['msg']?.toString() ?? 'No message';

        // await _dbHelper.updateLogActSync(actPOS.logID);
        if (status == 'success') {
          final updated = await _dbHelper.DeleteLogActSync(actPOS.logID);
          print("✅ Sync updated rows: $updated");
          actPOSList.removeWhere((t) => t.logID == actPOS.logID);
          // await _log("success", actPOS.logID, statusReturn: status);
          await Future.delayed(const Duration(milliseconds: 500));
          await _loadActPOS();
        } else {
          print("❌ close trans : failed ($msg)");
          await Future.delayed(const Duration(milliseconds: 500));
          await _loadActPOS();
          // await _log("failed", actPOS.logID, statusReturn: msg);
        }
      },
      error: (data, _, __, ___) async {
        await Future.delayed(const Duration(milliseconds: 500));
        await _loadActPOS();
        //  / await _log("error", actPOS.logID, statusReturn: data);
      },
      failure: (e) async {
        final msg = getContentErrorHTTP(e)['error_message'];
        await Future.delayed(const Duration(milliseconds: 500));
        await _loadActPOS();
        // await _log("exception", actPOS.logID, statusReturn: msg);
      },
    );
  }

  Future<void> _sendToCloud(TransactionLiteAllModel transaction) async {
    debugPrint("Send To Cloud: ${jsonEncode(transaction)}", wrapWidth: 1024);
    final txNumber = transaction.transactionNumber;

    await _log("first hit", txNumber);

    try {
      if (transaction.customerCode != null) {
        await _createCustomer(transaction);
      }
      await _closeTransaction(transaction);
    } finally {
      await Future.delayed(const Duration(milliseconds: 500));
      _sendingTransactions.remove(txNumber);
      print("✅ Done sending $txNumber");
    }
  }

  Future<void> _createCustomer(TransactionLiteAllModel transaction) async {
    final data =
        await _dbHelper.getCustomer(customerCode: transaction.customerCode);
    final customer = data.first;

    final body = {
      "customerID": customer.customerID,
      "customerCode": customer.customerCode,
      "fullname": customer.fullname,
      "email": customer.email,
      "mobileNo": customer.mobileNo,
      "birthDate": customer.birthDate,
      "provinceID": customer.provinceID,
      "cityID": customer.cityID,
      "address": customer.address,
      "outletID": customer.outletID,
    };

    await _sendDataRepository.createCustomer(body: body);
  }

  Future<void> _closeTransaction(TransactionLiteAllModel transaction) async {
    final result = await _sendDataRepository.createTransactionClose(
        body: transaction.toJson());

    result.when(
      success: (data, _, __, ___) async {
        final res = json.decode(data);
        final status = res['status'] ?? 'failed';
        final msg = res['msg']?.toString() ?? 'No message';

        if (status == 'success') {
          final updated = await _dbHelper
              .updateTransactionSync(transaction.transactionNumber);
          print("✅ Sync updated rows: $updated");
          transactionCloseList.removeWhere(
              (t) => t.transactionNumber == transaction.transactionNumber);
          await _log("success", transaction.transactionNumber,
              statusReturn: status);
          await Future.delayed(const Duration(milliseconds: 500));
          await _loadPendingTransactions();
        } else {
          print("❌ close trans : failed ($msg)");
          await Future.delayed(const Duration(milliseconds: 500));
          await _loadPendingTransactions();
          await _log("failed", transaction.transactionNumber,
              statusReturn: msg);
        }
      },
      error: (data, _, __, ___) async {
        await Future.delayed(const Duration(milliseconds: 500));
        await _loadPendingTransactions();
        await _log("error", transaction.transactionNumber, statusReturn: data);
      },
      failure: (e) async {
        final msg = getContentErrorHTTP(e)['error_message'];
        await Future.delayed(const Duration(milliseconds: 500));
        await _loadPendingTransactions();
        await _log("exception", transaction.transactionNumber,
            statusReturn: msg);
      },
    );
  }

  Future<void> _log(String message, String txNumber,
      {String statusReturn = "-"}) async {
    final now = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.fullDateTime);

    await _dbHelper.insertLogLite(
        dateTime: now,
        transactionNumber: txNumber,
        statusReturn: statusReturn,
        statusMessage: message);
  }
}
