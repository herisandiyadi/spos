import 'dart:convert';
import 'dart:io';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_payment_method/g_payment_method.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_all/g_transaction_all.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail_close/g_transaction_detail_close.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

final dbHelper = DatabaseHelper();

var paymentMethodList = <PaymentMethodLiteModel>[];
var transactionCloseList = <TransactionLiteAllModel>[];
var transactionDetailList = <TransactionDetailLiteModel>[];
var transactionDetailCloseList = <TransactionDetailCloseLiteModel>[];
var transactionDetailUnsendList = <TransactionDetailLiteModel>[];

int bulatkanKe500(int harga) {
  return ((harga + 499) ~/ 500) * 500;
}

Future<List<int>> generateTicket({
  required String title,
  String? imageAssetPath,
  required String transactionNumber,
  required String type,
  required int rePrint,
  int? stationID,
  String? stationName,
  required String tableLabel,
  String? summaryType,
}) async {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String tdata = DateFormat("HH:mm:ss").format(DateTime.now());

  final profile = await CapabilityProfile.load();
  Generator generator;
  // final transactionOrderOfflineController = Get.find<OrderOfflineController>();
  // var taxName = transactionOrderOfflineController.taxName.value;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var outletName = sharedPreferences.getString("outletName");
  var outletImageUrl = sharedPreferences.getString("outletImageUrl");
  var staffName = sharedPreferences.getString("staffName")!;
  var outletFB = sharedPreferences.getString("outletFB");
  var outletIG = sharedPreferences.getString("outletIG");
  var outletTIKTOK = sharedPreferences.getString("outletTIKTOK");
  var outletWeb = sharedPreferences.getString("outletWeb");

  generator = Generator(PaperSize.mm58, profile);
  List<int> bytes = [];

  bytes += generator.reset();

  if (type != 'printDocket') {
    if (outletImageUrl != '') {
      final Uint8List imageBytes = await File(outletImageUrl!).readAsBytes();
      final img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        final resizedImage = img.copyResize(image, width: 200);
        bytes += generator.image(resizedImage, align: PosAlign.center);
      }
    }
  }

  List<Map<String, dynamic>> transRes =
      await dbHelper.getTransSpec(transactionNumber: transactionNumber);

  if (type == 'printDocket') {
    if (rePrint == 1) {
      bytes += generator.row([
        PosColumn(
          text: 'Reprint',
          width: 12,
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
      ]);
    }
    bytes += generator.feed(1);
    bytes += generator.row([
      PosColumn(
        text: stationName!,
        width: 12,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);
  } else if (type == 'printSummary') {
    if (rePrint == 1) {
      bytes += generator.row([
        PosColumn(
          text: 'Summary Payments',
          width: 12,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  } else {
    if (type == 'printBill') {
      bytes += generator.row([
        PosColumn(
          text: 'Bills',
          width: 12,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: 'THIS IS NOT RECEIPT',
          width: 12,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    } else {
      bytes += generator.row([
        PosColumn(
          text: 'Receipts',
          width: 12,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  }
  bytes += generator.hr();
  // bytes += generator.row([
  //   PosColumn(
  //     text: '$outletName',
  //     width: 12,
  //     styles: const PosStyles(align: PosAlign.center),
  //   ),
  // ]);
  bytes += generator.row([
    PosColumn(
      text: '$cdate $tdata ',
      width: 12,
      styles: const PosStyles(align: PosAlign.left),
    ),
  ]);
  if (tableLabel != '') {
    bytes += generator.row([
      PosColumn(
        text: 'Table $tableLabel - $staffName',
        width: 12,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
    ]);
  }

  if (type != 'printSummary') {
    bytes += generator.row([
      PosColumn(
        text:
            '${transRes[0]['transactionType']} - ${transRes[0]['customerName']}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
  }
  bytes += generator.hr();

  if (type == 'printSummary') {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (summaryType == 'payment') {
      List<Map<String, dynamic>> transRes =
          await dbHelper.getTransactionClose(startDate: today, endDate: today);
      Iterable listTransRes = transRes;
      transactionCloseList = listTransRes
          .map((model) => TransactionLiteAllModel.fromJson(model))
          .toList();

      List<Map<String, dynamic>> paymentRes =
          await dbHelper.getPaymentMethodLite();
      Iterable listPaymentRes = paymentRes;
      paymentMethodList = listPaymentRes
          .map((model) => PaymentMethodLiteModel.fromJson(model))
          .toList();

      int indx = 0;
      for (var itemRes in paymentMethodList) {
        int totalPMethod = transactionCloseList
            .expand((tClose) => tClose.paymentMethod)
            .where((payment) =>
                payment['method'] == paymentMethodList[indx].paymentMethodName)
            .fold(0, (sum, payment) => sum + (payment['amount'] as int));
        int countPMethod = transactionCloseList
            .expand((tClose) => tClose.paymentMethod)
            .where((payment) =>
                payment['method'] == paymentMethodList[indx].paymentMethodName)
            .length;

        bytes += generator.row([
          PosColumn(
            text: '$countPMethod x ${itemRes.paymentMethodName}',
            width: 7,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: '${numberFormatNoIDR(totalPMethod)}',
            width: 5,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
        indx++;
      }
      bytes += generator.feed(1);
      var grandTotalFinal = transactionCloseList.fold(
          0, (sum, item) => sum + item.grandTotalFinal);
      bytes += generator.row([
        PosColumn(
          text: 'Grand Total',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${numberFormatNoIDR(grandTotalFinal)}',
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    } else {
      List<Map<String, dynamic>> transDetailRes = await dbHelper
          .getTransactionDetailClose(startDate: today, endDate: today);
      Iterable list = transDetailRes;
      transactionDetailCloseList = list
          .map((model) => TransactionDetailCloseLiteModel.fromJson(model))
          .where((trans) => trans.datetime.startsWith(today))
          .toList();

      for (var productRes in transactionDetailCloseList) {
        bytes += generator.row([
          PosColumn(
            text: '${productRes.totalQty} x ${productRes.menuName} ',
            width: 7,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: '${numberFormatNoIDR(productRes.totalPrice)}',
            width: 5,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }

      List<Map<String, dynamic>> transRes =
          await dbHelper.getTransactionClose(startDate: today, endDate: today);
      Iterable listTransRes = transRes;
      transactionCloseList = listTransRes
          .map((model) => TransactionLiteAllModel.fromJson(model))
          .where((trans) => trans.datetime.startsWith(today))
          .toList();
      var grandTotalFinal = transactionCloseList.fold(
          0, (sum, item) => sum + item.grandTotalFinal);
      var discountTotal =
          transactionCloseList.fold(0, (sum, item) => sum + item.discountTotal);
      var roundingTotal =
          transactionCloseList.fold(0, (sum, item) => sum + item.rounding);

      bytes += generator.row([
        PosColumn(
          text: 'Total',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: numberFormatNoIDR(
              grandTotalFinal - roundingTotal + discountTotal),
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.feed(1);
      bytes += generator.row([
        PosColumn(
          text: 'Total Discounts',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${numberFormatNoIDR(discountTotal)}',
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: 'Total Roundings',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${numberFormatNoIDR(roundingTotal)}',
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: 'Grand Total',
          width: 7,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${numberFormatNoIDR(grandTotalFinal)}',
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
  } else {
    List<Map<String, dynamic>> transDetailRes = await dbHelper
        .getTransactionDetail(transactionNumber: transactionNumber);
    Iterable list = transDetailRes;
    if (type == 'printDocket') {
      transactionDetailList = list
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .where((item) => item.statusSend == rePrint)
          .where((item) => item.stationID == stationID)
          .toList();
    } else {
      transactionDetailList = list
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .where((item) => item.statusSend == rePrint)
          .toList();
    }
    for (var i = 0; i < transactionDetailList.length; i++) {
      List<Map<String, dynamic>> transDetailAddonRes =
          await dbHelper.getTransactionDetailAddOn(
              transactionDetailList[i].transactionDetailID);

      transactionDetailList[i] =
          transactionDetailList[i].copyWith(addOn: transDetailAddonRes);
    }

    transactionDetailList = List.from(transactionDetailList);

    var jumItem = 0;
    num subTotalP = 0;
    num totalAddOnP = 0;
    for (var cartPrint in transactionDetailList) {
      // num normalPrice = cartPrint.menuPrice;
      // :: Harusnya bukan normal price tapi price after discount
      num priceAfterDiscount = cartPrint.menuPriceAfterDiscount;
      num finalPrice = 0;
      finalPrice = (cartPrint.menuPrice).toInt();

      if (type == 'printDocket') {
        bytes += generator.row([
          PosColumn(
            text: '${cartPrint.qty} x ${cartPrint.menuName}',
            width: 12,
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
            ),
          ),
        ]);

        for (var resAddon in cartPrint.addOn) {
          bytes += generator.row([
            PosColumn(
              text: '',
              width: 1,
            ),
            PosColumn(
              text: '- ${resAddon['menuName']}',
              width: 11,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
              ),
            ),
          ]);
        }
        if (cartPrint.noteOption != '') {
          bytes += generator.row([
            PosColumn(
              text: '',
              width: 1,
            ),
            PosColumn(
              text: 'Note Option : ${cartPrint.noteOption}',
              width: 11,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
              ),
            ),
          ]);
        }
        // if (cartPrint.noteOption != '') {
        //   bytes += generator.row([
        //     PosColumn(
        //       text: '',
        //       width: 1,
        //     ),
        //     PosColumn(
        //       text: 'Note Option : ${cartPrint.noteOption}',
        //       width: 11,
        //       styles: const PosStyles(
        //         align: PosAlign.left,
        //         height: PosTextSize.size1,
        //         width: PosTextSize.size1,
        //       ),
        //     ),
        //   ]);
        // }
        if (cartPrint.notes != '') {
          bytes += generator.row([
            PosColumn(
              text: '',
              width: 1,
            ),
            PosColumn(
              text: 'Notes : ${cartPrint.notes}',
              width: 11,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
              ),
            ),
          ]);
        }
      } else {
        subTotalP += finalPrice * cartPrint.qty;
        bytes += generator.row([
          PosColumn(
            text: cartPrint.menuName,
            width: 12,
            styles: const PosStyles(align: PosAlign.left),
          ),
        ]);
        bytes += generator.row([
          PosColumn(
            text: '${cartPrint.qty} x ${numberFormatNoIDR(priceAfterDiscount)}',
            width: 7,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: numberFormatNoIDR(priceAfterDiscount * cartPrint.qty)
                .toString(),
            width: 5,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
        for (var resAddon in cartPrint.addOn) {
          totalAddOnP += resAddon['menuPrice'] * cartPrint.qty;
          bytes += generator.row([
            PosColumn(
              text: '- ${resAddon['menuName']}',
              width: 7,
              styles: const PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: numberFormatNoIDR(resAddon['menuPrice'] * cartPrint.qty)
                  .toString(),
              width: 5,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
        if (cartPrint.noteOption != '') {
          bytes += generator.row([
            PosColumn(
              text: 'Note : ${cartPrint.noteOption}',
              width: 7,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
              ),
            ),
            PosColumn(
              text: '',
              width: 5,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
        if (cartPrint.notes != '') {
          bytes += generator.row([
            PosColumn(
              text: 'Notes : ${cartPrint.notes}',
              width: 7,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
              ),
            ),
            PosColumn(
              text: '',
              width: 5,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
      }
      jumItem += cartPrint.qty;
    }

    if (type == 'printBill' || type == 'printReceipt') {
      // var transactionNumber = transRes[0]['transactionNumber'];
      // var customerName = transRes[0]['customerName'];
      // var subTotal = transRes[0]['subTotal'];

      num discount = 0;

      for (var i = 0; i < transactionDetailList.length; i++) {
        final decoded = transactionDetailList[i].discountDetail;

        for (var data in decoded) {
          if (data['discountTotal'] != null) {
            discount += data['discountTotal'] as num;
          }
        }
      }

      var discountTotal = discount;
      var grandTotalBeforeTax = transRes[0]['grandTotalBeforeTax'];
      var ppn = transRes[0]['ppn'];
      var grandTotalAfterTax = transRes[0]['grandTotalAfterTax'];
      // num grandTotalInPrint = 0;

      bytes += generator.feed(1);
      if (discountTotal != 0) {
        grandTotalBeforeTax =
            (subTotalP.toInt() + totalAddOnP.toInt()) - discountTotal;
        // ppn = grandTotalBeforeTax * 0.1;
        ppn = 0;
        grandTotalAfterTax = grandTotalBeforeTax + ppn;

        bytes += generator.row([
          PosColumn(
            text: 'Discount',
            width: 5,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: numberFormatNoIDR(discountTotal).toString(),
            width: 7,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }
      bytes += generator.row([
        PosColumn(
          text: 'Subtotal',
          width: 6,
          styles: const PosStyles(
            align: PosAlign.left,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
        PosColumn(
          text: numberFormatNoIDR(grandTotalBeforeTax).toString(),
          width: 6,
          styles: const PosStyles(
            align: PosAlign.right,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
      ]);
      if (ppn != 0) {
        bytes += generator.row([
          PosColumn(
            text: transRes[0]['ppnName'] ?? '-',
            width: 5,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: numberFormatNoIDR(ppn).toString(),
            width: 7,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }

      num rounding =
          bulatkanKe500(grandTotalAfterTax.toInt()) - grandTotalAfterTax;
      grandTotalAfterTax = bulatkanKe500(grandTotalAfterTax.toInt());

      bytes += generator.row([
        PosColumn(
          text: 'Round',
          width: 5,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: numberFormatNoIDR(rounding).toString(),
          width: 7,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: 'Grand Total',
          width: 5,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: numberFormatNoIDR(grandTotalAfterTax).toString(),
          width: 7,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: 'Total Due',
          width: 5,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text:
              numberFormatNoIDR(type == 'printReceipt' ? 0 : grandTotalAfterTax)
                  .toString(),
          width: 7,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);

      if (type == 'printReceipt') {
        var payMethod = jsonDecode(transRes[0]['paymentMethod']);
        bytes += generator.hr();
        for (var resP in payMethod) {
          if (resP["method"] == 'Cash') {
            bytes += generator.row([
              PosColumn(
                text: resP["method"],
                width: 5,
                styles: const PosStyles(align: PosAlign.left),
              ),
              PosColumn(
                text: numberFormatNoIDR(resP["pay"]).toString(),
                width: 7,
                styles: const PosStyles(align: PosAlign.right),
              ),
            ]);

            bytes += generator.row([
              PosColumn(
                text: 'Change',
                width: 5,
                styles: const PosStyles(align: PosAlign.left),
              ),
              PosColumn(
                text: numberFormatNoIDR(resP["pay"] - grandTotalAfterTax)
                    .toString(),
                width: 7,
                styles: const PosStyles(align: PosAlign.right),
              ),
            ]);
          } else {
            bytes += generator.row([
              PosColumn(
                text: 'Payment',
                width: 5,
                styles: const PosStyles(align: PosAlign.left),
              ),
              PosColumn(
                text: resP["method"],
                width: 7,
                styles: const PosStyles(align: PosAlign.right),
              ),
            ]);
          }
        }
      }
    }

    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: '$jumItem Item / $transactionNumber',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    // bytes += generator.row([
    //   PosColumn(
    //     text: transactionNumber,
    //     width: 12,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    // ]);
    // bytes += generator.row([
    //   PosColumn(
    //     text: staffName,
    //     width: 12,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    // ]);
    bytes += generator.row([
      PosColumn(
        text:
            'Your Order #${transactionNumber.substring(transactionNumber.length - 3)}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);
    // bytes += generator.row([
    //   PosColumn(
    //     text: '#${transactionNumber.substring(transactionNumber.length - 3)}',
    //     width: 12,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    // ]);

    if (type != 'printDocket') {
      if (outletFB != '') {
        bytes += generator.row([
          PosColumn(
            text: '$outletFB',
            width: 12,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletIG != '') {
        bytes += generator.row([
          PosColumn(
            text: '$outletIG',
            width: 12,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletTIKTOK != '') {
        bytes += generator.row([
          PosColumn(
            text: '$outletTIKTOK',
            width: 12,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletWeb != '') {
        bytes += generator.row([
          PosColumn(
            text: '$outletWeb',
            width: 12,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      bytes += generator.feed(1);
      bytes += generator.row([
        PosColumn(
          text: 'Powered by squadra.id',
          width: 12,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  }
  bytes += generator.feed(2);
  return bytes;
}

void printDocket(
    rePrint, transactionNumber, stationID, stationName, tableLabel) async {
  debugPrint('transnum: ${transactionNumber}');
  bool connected = await PrintBluetoothThermal.connectionStatus;
  transactionDetailList = [];
  Iterable list = [];
  if (!connected) return;

  List<Map<String, dynamic>> transDetailRes =
      await dbHelper.getTransactionDetail(transactionNumber: transactionNumber);

  list = transDetailRes;
  transactionDetailList = list
      .map((model) => TransactionDetailLiteModel.fromJson(model))
      .where((item) => item.statusSend == rePrint)
      .where((item) => item.stationID == stationID)
      .toList();

  transactionDetailList = List.from(transactionDetailList);

  if (transactionDetailList.isNotEmpty) {
    List<int> ticket = await generateTicket(
      title: "Squadra",
      imageAssetPath: 'assets/images/logoText.png',
      transactionNumber: transactionNumber,
      type: 'printDocket',
      rePrint: rePrint,
      stationID: stationID,
      stationName: stationName,
      tableLabel: tableLabel,
    );

    await PrintBluetoothThermal.writeBytes(ticket);
  }
}

void printBill(transactionNumber, tableLabel) async {
  bool connected = await PrintBluetoothThermal.connectionStatus;

  if (!connected) return;

  List<int> ticket = await generateTicket(
    title: "Squadra",
    imageAssetPath: 'assets/images/logoText.png',
    type: 'printBill',
    transactionNumber: transactionNumber,
    rePrint: 1,
    tableLabel: tableLabel,
  );

  await PrintBluetoothThermal.writeBytes(ticket);
}

void printReceipt(transactionNumber, tableLabel) async {
  bool connected = await PrintBluetoothThermal.connectionStatus;
  if (!connected) return;

  List<int> ticket = await generateTicket(
    title: "Squadra",
    imageAssetPath: 'assets/images/logoText.png',
    type: 'printReceipt',
    transactionNumber: transactionNumber,
    rePrint: 1,
    tableLabel: tableLabel,
  );

  await PrintBluetoothThermal.writeBytes(ticket);
}

void printSummary({required String type}) async {
  bool connected = await PrintBluetoothThermal.connectionStatus;

  if (!connected) return;

  List<int> ticket = await generateTicket(
    title: "Squadra",
    imageAssetPath: 'assets/images/logoText.png',
    type: 'printSummary',
    transactionNumber: '',
    rePrint: 1,
    tableLabel: '',
    summaryType: type,
  );

  await PrintBluetoothThermal.writeBytes(ticket);
}
