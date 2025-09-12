import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/create/c_transaction_lite.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/loader/loader_general.dart';

class CreateCustomerController extends GetxController {
  CreateCustomerController(this.localStorage, this.tableOfflineController);

  final LocalStorage localStorage;
  final ReserveOfflineController tableOfflineController;

  final dbHelper = DatabaseHelper();

  final customerName = TextEditingController();
  final guestNumber = TextEditingController();

  // Toggle state
  final RxBool isDineIn = true.obs;
  final RxBool isTakeaway = false.obs;
  final RxBool isDelivery = false.obs;

  String get transactionType {
    if (isDineIn.value) return 'Dine In';
    if (isTakeaway.value) return 'Takeaway';
    return 'Delivery';
  }

  void selectTransactionType(int index, int type) {
    if (type == tad) {
      isDineIn.value = false;
      isTakeaway.value = index == 0;
      isDelivery.value = index == 1;
    } else {
      isDineIn.value = index == 0;
      isTakeaway.value = index == 1;
      isDelivery.value = index == 2;
    }
  }

  void resetCreateCustomer({required int type}) {
    customerName.clear();
    guestNumber.clear();

    if (type == tad) {
      isDineIn.value = false;
      isTakeaway.value = true;
      isDelivery.value = false;
    } else {
      isDineIn.value = true;
      isTakeaway.value = false;
      isDelivery.value = false;
    }
  }

  void addGuestNumber(String value) {
    guestNumber.text += value;
  }

  void deleteGuestNumber() {
    if (guestNumber.text.isNotEmpty) {
      guestNumber.text =
          guestNumber.text.substring(0, guestNumber.text.length - 1);
    }
  }

  void clearCustomerInput() {
    customerName.clear();
    guestNumber.clear();
  }

  Future<void> openBill(
      {required int tableId, required String transactionType}) async {
    if (guestNumber.text.isEmpty && transactionType == 'Dine In') return;

    Get.back();

    LoaderGeneral.show(tag: "create_customer");

    await Future.delayed(const Duration(milliseconds: 1000));

    final transactionNumber = await dbHelper.generateTransactionNumber();
    final today = dateWithTime(DateTime.now().toString());

    final posLoginId = await localStorage.getPosLoginID();
    final outletName = await localStorage.getOutletName();
    final staffPinId = await localStorage.getStaffPinId();

    final name =
        customerName.text.trim().isEmpty ? "Guest" : customerName.text.trim();
    final number = int.tryParse(guestNumber.text.trim()) ?? 1;

    final transaction = TransactionLiteCreate(
        transactionNumber: transactionNumber,
        datetime: today,
        outletName: outletName,
        customerID: 0,
        customerName: name,
        tableID: tableId,
        guestNumber: number,
        transactionType: transactionType,
        subTotal: 0,
        discountTotal: 0,
        discountOnTrans: '[]',
        discountOnDetail: '[]',
        grandTotalBeforeTax: 0,
        ppn: 0,
        ppnName: '',
        serviceCharge: 0,
        packageNService: 0,
        grandTotalAfterTax: 0,
        rounding: 0,
        grandTotalFinal: 0,
        posLoginID: posLoginId,
        closeBillStaffID: int.tryParse(staffPinId) ?? 0,
        paymentMethod: '',
        statusTransaction: 'Open',
        statusSync: 0,
        statusReceipt: 0,
        closeDate: today);

    await dbHelper.createTransaction(transaction);

    final arguments = {
      "table_id": tableId,
      "order_type": offline,
      "transaction_number": transactionNumber,
    };

    await tableOfflineController.initLocationAndTables().then((_) {
      clearCustomerInput();

      Get.offNamedUntil(RouteName.orderOffline, (route) => route.isFirst,
          arguments: arguments);
    });

    LoaderGeneral.hide(tag: "create_customer");
  }

  @override
  void onClose() {
    clearCustomerInput();

    // :: Sementara jangan di dispose dulu
    // customerName.dispose();
    // guestNumber.dispose();

    super.onClose();
  }
}
