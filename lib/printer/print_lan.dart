import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:image/image.dart' as img;
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_payment_method/g_payment_method.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_all/g_transaction_all.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

final dbHelper = DatabaseHelper();

var transClose = <TransactionLiteAllModel>[];
var transDetail = <TransactionDetailLiteModel>[];
var transDetailUnsend = <TransactionDetailLiteModel>[];
var payments = <PaymentMethodLiteModel>[];

int bulatkanKe500(int harga) {
  return ((harga + 499) ~/ 500) * 500;
}

// void printBillLanss_old(transactionNumber, printerIP, tableLabel) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var outletName = sharedPreferences.getString("outletName");
//   var staffName = sharedPreferences.getString("staffName")!;
//   var outletImageUrl = sharedPreferences.getString("outletImageUrl");
//   var outletFB = sharedPreferences.getString("outletFB");
//   var outletIG = sharedPreferences.getString("outletIG");
//   var outletTIKTOK = sharedPreferences.getString("outletTIKTOK");
//   var outletWeb = sharedPreferences.getString("outletWeb");
//   const PaperSize paper = PaperSize.mm80;
//   final profile = await CapabilityProfile.load();
//   final printer = NetworkPrinter(paper, profile);

//   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

//   final PosPrintResult res = await printer.connect(printerIP, port: 9100);

//   if (res == PosPrintResult.success) {
//     List<Map<String, dynamic>> transRes =
//         await dbHelper.getTransSpec(transactionNumber: transactionNumber);
//     List<Map<String, dynamic>> paymentRes =
//         await dbHelper.getPaymentMethodLite();
//     List<Map<String, dynamic>> transResClose =
//         await dbHelper.getTransactionClose(startDate: today, endDate: today);
//     List<Map<String, dynamic>> transDetailRes = await dbHelper
//         .getTransactionDetail(transactionNumber: transactionNumber);

//     Iterable list = transDetailRes;
//     transDetail = list
//         .map((model) => TransactionDetailLiteModel.fromJson(model))
//         .where((item) => item.statusSend == 1)
//         .toList();
//     for (var i = 0; i < transDetail.length; i++) {
//       List<Map<String, dynamic>> transDetailAddonRes = await dbHelper
//           .getTransactionDetailAddOn(transDetail[i].transactionDetailID);

//       transDetail[i] = transDetail[i].copyWith(addOn: transDetailAddonRes);
//     }

//     transDetail = List.from(transDetail);

//     Uint8List? outletImageUrlData;
//     if (outletImageUrl != '') {
//       final File file = File(outletImageUrl!);
//       outletImageUrlData = await file.readAsBytes();
//     }
//     printTemplate(
//       printer,
//       transactionNumber,
//       "printBill",
//       1,
//       transRes,
//       paymentRes,
//       transResClose,
//       transDetail,
//       outletName,
//       outletImageUrlData,
//       outletFB,
//       outletIG,
//       outletTIKTOK,
//       outletWeb,
//       tableLabel,
//       staffName,
//     );
//     printer.disconnect();
//   }
//   print('Print result: ${res.msg}');
// }

// void printReceiptLanss_old(transactionNumber, printerIP, tableLabel) async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var outletName = sharedPreferences.getString("outletName");
//   var staffName = sharedPreferences.getString("staffName")!;
//   var outletImageUrl = sharedPreferences.getString("outletImageUrl");
//   var outletFB = sharedPreferences.getString("outletFB");
//   var outletIG = sharedPreferences.getString("outletIG");
//   var outletTIKTOK = sharedPreferences.getString("outletTIKTOK");
//   var outletWeb = sharedPreferences.getString("outletWeb");

//   const PaperSize paper = PaperSize.mm80;
//   final profile = await CapabilityProfile.load();
//   final printer = NetworkPrinter(paper, profile);

//   final PosPrintResult res = await printer.connect(printerIP, port: 9100);

//   String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

//   if (res == PosPrintResult.success) {
//     List<Map<String, dynamic>> transRes =
//         await dbHelper.getTransSpec(transactionNumber: transactionNumber);
//     List<Map<String, dynamic>> paymentRes =
//         await dbHelper.getPaymentMethodLite();
//     List<Map<String, dynamic>> transResClose =
//         await dbHelper.getTransactionClose(startDate: today, endDate: today);
//     List<Map<String, dynamic>> transDetailRes = await dbHelper
//         .getTransactionDetail(transactionNumber: transactionNumber);

//     Iterable list = transDetailRes;
//     transDetail = list
//         .map((model) => TransactionDetailLiteModel.fromJson(model))
//         .where((item) => item.statusSend == 1)
//         .toList();
//     for (var i = 0; i < transDetail.length; i++) {
//       List<Map<String, dynamic>> transDetailAddonRes = await dbHelper
//           .getTransactionDetailAddOn(transDetail[i].transactionDetailID);

//       transDetail[i] = transDetail[i].copyWith(addOn: transDetailAddonRes);
//     }

//     transDetail = List.from(transDetail);

//     Uint8List? outletImageUrlData;
//     if (outletImageUrl != '') {
//       final File file = File(outletImageUrl!);
//       outletImageUrlData = await file.readAsBytes();
//     }
//     printTemplate(
//       printer,
//       transactionNumber,
//       "printReceipt",
//       1,
//       transRes,
//       paymentRes,
//       transResClose,
//       transDetail,
//       outletName,
//       outletImageUrlData,
//       outletFB,
//       outletIG,
//       outletTIKTOK,
//       outletWeb,
//       tableLabel,
//       staffName,
//     );
//     printer.disconnect();
//   }
// }

void printDocketLan(reprint, transactionNumber, printerIP, stationID,
    stationName, tableLabel) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var outletName = sharedPreferences.getString("outletName");
  var staffName = sharedPreferences.getString("staffName")!;
  var outletImageUrl = sharedPreferences.getString("outletImageUrl");
  var outletFB = sharedPreferences.getString("outletFB");
  var outletIG = sharedPreferences.getString("outletIG");
  var outletTIKTOK = sharedPreferences.getString("outletTIKTOK");
  var outletWeb = sharedPreferences.getString("outletWeb");
  const PaperSize paper = PaperSize.mm80;
  final profile = await CapabilityProfile.load();
  final printer = NetworkPrinter(paper, profile);

  final PosPrintResult res = await printer.connect(printerIP, port: 9100);
  // final transactionOrderOfflineController = Get.find<OrderOfflineController>();
  // var taxName = transactionOrderOfflineController.taxName.value;
  String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

  if (res == PosPrintResult.success) {
    List<Map<String, dynamic>> transRes =
        await dbHelper.getTransSpec(transactionNumber: transactionNumber);
    List<Map<String, dynamic>> paymentRes =
        await dbHelper.getPaymentMethodLite();
    List<Map<String, dynamic>> transResClose =
        await dbHelper.getTransactionClose(startDate: today, endDate: today);
    List<Map<String, dynamic>> transDetailRes = await dbHelper
        .getTransactionDetail(transactionNumber: transactionNumber);

    Iterable list = transDetailRes;
    if (stationName.toLowerCase() == 'checker') {
      transDetail = list
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .where((item) => item.statusSend == reprint)
          .toList();
    } else {
      transDetail = list
          .map((model) => TransactionDetailLiteModel.fromJson(model))
          .where((item) => item.statusSend == reprint)
          .where((item) => item.stationID == stationID)
          .toList();
    }

    for (var i = 0; i < transDetail.length; i++) {
      var transDetailAddonRes = await dbHelper
          .getTransactionDetailAddOn(transDetail[i].transactionDetailID);

      // transDetail[i].addOn = transDetailAddonRes;

      transDetail[i] = transDetail[i].copyWith(addOn: transDetailAddonRes);
    }

    transDetail = List.from(transDetail);
    if (transDetail.isNotEmpty) {
      printTemplate(
          printer,
          transactionNumber,
          "printDocket",
          reprint,
          transRes,
          paymentRes,
          transResClose,
          transDetail,
          outletName,
          outletImageUrl,
          outletFB,
          outletIG,
          outletTIKTOK,
          outletWeb,
          tableLabel,
          staffName,
          stationName);
    }
    printer.disconnect();
  }
}

void printTemplate(
    NetworkPrinter printer,
    transactionNumber,
    type,
    rePrint,
    transRes,
    paymentRes,
    transResClose,
    transDetail,
    outletName,
    outletImageUrlData,
    outletFB,
    outletIG,
    outletTIKTOK,
    outletWeb,
    tableLabel,
    staffName,
    [stationName]) async {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String tdata = DateFormat("HH:mm:ss").format(DateTime.now());

  if (type != 'printDocket') {
    if (outletImageUrlData != '') {
      final img.Image? image = img.decodeImage(outletImageUrlData);
      final img.Image resizedImage = img.copyResize(image!, width: 150);

      printer.image(resizedImage);
    }
  }
  if (type == 'printDocket') {
    printer.feed(3);
    if (rePrint == 1) {
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'Reprint',
          width: 10,
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true, // Menebalkan teks
            height: PosTextSize.size2, // Tinggi font (size2 = lebih besar)
            width: PosTextSize.size2,
          ),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
    printer.feed(1);
    printer.row([
      PosColumn(
        text: stationName.toString(),
        width: 12,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);
  } else if (type == 'printSummary') {
    if (rePrint == 1) {
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'Summary Payment',
          width: 10,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  } else {
    if (type == 'printBill') {
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'Bill',
          width: 10,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'THIS IS NOT RECEIPT',
          width: 10,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    } else {
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'Receipt',
          width: 10,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  }
  printer.hr();
  // printer.row([
  //   PosColumn(
  //     text: '',
  //     width: 1,
  //     styles: const PosStyles(align: PosAlign.center),
  //   ),
  //   PosColumn(
  //     text: '$outletName',
  //     width: 11,
  //     styles: const PosStyles(align: PosAlign.center),
  //   ),
  //   PosColumn(
  //     text: '',
  //     width: 1,
  //     styles: const PosStyles(align: PosAlign.center),
  //   ),
  // ]);
  printer.row([
    PosColumn(
      text: '$cdate $tdata',
      width: 12,
      styles: const PosStyles(align: PosAlign.left),
    ),
  ]);
  if (tableLabel != '') {
    printer.row([
      PosColumn(
        text: 'Table $tableLabel - $staffName',
        width: 12,
        styles: const PosStyles(align: PosAlign.left, bold: true),
      ),
    ]);
  }
  if (type != 'printSummary') {
    printer.row([
      PosColumn(
        text:
            '${transRes[0]['transactionType']} - ${transRes[0]['customerName']}',
        width: 11,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: '',
        width: 1,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);
  }
  printer.hr();

  if (type == 'printSummary') {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    Iterable listTransRes = transResClose;
    transClose = listTransRes
        .map((model) => TransactionLiteAllModel.fromJson(model))
        .where((trans) => trans.datetime.startsWith(today))
        .toList();

    Iterable listPaymentRes = paymentRes;
    payments = listPaymentRes
        .map((model) => PaymentMethodLiteModel.fromJson(model))
        .toList();

    int indx = 0;
    for (var itemRes in payments) {
      int totalPMethod = transClose
          .expand((tClose) => tClose.paymentMethod)
          .where((payment) =>
              payment['method'] == payments[indx].paymentMethodName)
          .fold(0, (sum, payment) => sum + (payment['amount'] as int));

      printer.row([
        PosColumn(
          text: '${itemRes.paymentMethodName} x',
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
  } else {
    transDetail = List.from(transDetail);

    num jumItem = 0;
    num subTotalP = 0;
    num totalAddOnP = 0;
    for (var cartPrint in transDetail) {
      num normalPrice = cartPrint.menuPrice;
      num finalPrice = 0;
      finalPrice = (cartPrint.menuPrice).toInt();

      if (type == 'printDocket') {
        final List<String> wrappedName =
            wrapText(cartPrint['menuName'], 20); // 20 karakter per baris

        for (int i = 0; i < wrappedName.length; i++) {
          printer.row([
            PosColumn(
              text: i == 0
                  ? '${cartPrint.qty} x ${wrappedName[i]}'
                  : wrappedName[i],
              width: 11,
              styles: const PosStyles(
                align: PosAlign.left,
                height: PosTextSize.size2,
                width: PosTextSize.size2,
              ),
            ),
            PosColumn(
              text: '',
              width: 1,
            ),
          ]);
        }
        // printer.row([
        //   PosColumn(
        //     text: '',
        //     width: 1,
        //   ),
        //   PosColumn(
        //     text: '${cartPrint.qty} x ${cartPrint.menuName}',
        //     width: 11,
        //     styles: const PosStyles(
        //         align: PosAlign.left,
        //         height: PosTextSize.size2,
        //         width: PosTextSize.size2),
        //   ),
        // ]);

        for (var resAddon in cartPrint.addOn) {
          final List<String> wrappedNameaddOn =
              wrapText(resAddon['menuName'], 20); // 20 karakter per baris

          for (int i = 0; i < wrappedNameaddOn.length; i++) {
            printer.row([
              PosColumn(
                text: i == 0 ? '- ${wrappedNameaddOn[i]}' : wrappedNameaddOn[i],
                width: 11,
                styles: const PosStyles(
                  align: PosAlign.left,
                  height: PosTextSize.size2,
                  width: PosTextSize.size2,
                ),
              ),
              PosColumn(
                text: '',
                width: 1,
              ),
            ]);
          }
          // printer.row([
          //   PosColumn(
          //     text: '',
          //     width: 1,
          //   ),
          //   PosColumn(
          //     text: '- ${resAddon['menuName']}',
          //     width: 11,
          //     styles: const PosStyles(
          //         align: PosAlign.left,
          //         height: PosTextSize.size2,
          //         width: PosTextSize.size2),
          //   ),
          // ]);
        }
        if (cartPrint.noteOption != '') {
          printer.row([
            PosColumn(
              text: '',
              width: 1,
            ),
            PosColumn(
              text: 'Note : ${cartPrint.noteOption}',
              width: 11,
              styles: const PosStyles(
                  align: PosAlign.left,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1),
            ),
          ]);
        }
        if (cartPrint.notes != '') {
          printer.row([
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
        printer.row([
          PosColumn(
            text: '',
            width: 1,
          ),
          PosColumn(
            text: cartPrint.menuName,
            width: 11,
            styles: const PosStyles(align: PosAlign.left),
          ),
        ]);
        printer.row([
          PosColumn(
            text: '${cartPrint.qty} x ${numberFormatNoIDR(normalPrice)}',
            width: 7,
            styles: const PosStyles(align: PosAlign.left),
          ),
          PosColumn(
            text: numberFormatNoIDR(finalPrice * cartPrint.qty).toString(),
            width: 5,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
        for (var resAddon in cartPrint.addOn) {
          totalAddOnP += resAddon['menuPrice'] * cartPrint.qty;
          printer.row([
            PosColumn(
              text: '- ${resAddon['menuName']}',
              width: 7,
              styles: const PosStyles(align: PosAlign.left),
            ),
            PosColumn(
              text: numberFormatNoIDR(
                resAddon['menuPrice'] * cartPrint.qty,
              ).toString(),
              width: 5,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
        if (cartPrint.noteOption != '') {
          printer.row([
            PosColumn(
              text: 'Note : ${cartPrint.noteOption}',
              width: 7,
              styles: const PosStyles(
                  align: PosAlign.left,
                  height: PosTextSize.size1,
                  width: PosTextSize.size1),
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
      var discountTotal = transRes[0]['discountTotal'];
      var grandTotalBeforeTax = transRes[0]['grandTotalBeforeTax'];
      var ppn = transRes[0]['ppn'];
      var taxName = transRes[0]['ppnName'];
      var grandTotalAfterTax = transRes[0]['grandTotalAfterTax'];
      // num grandTotalInPrint = 0;
      printer.feed(1);
      if (discountTotal != 0) {
        grandTotalBeforeTax =
            (subTotalP.toInt() + totalAddOnP.toInt()) - discountTotal;
        // ppn = grandTotalBeforeTax * 0.1;
        ppn = 0;
        grandTotalAfterTax = grandTotalBeforeTax + ppn;
        printer.row([
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

      printer.row([
        PosColumn(
          text: 'Subtotal',
          width: 6,
          styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size1,
              width: PosTextSize.size1),
        ),
        PosColumn(
          text: numberFormatNoIDR(grandTotalBeforeTax).toString(),
          width: 6,
          styles: const PosStyles(
              align: PosAlign.right,
              height: PosTextSize.size1,
              width: PosTextSize.size1),
        ),
      ]);
      if (ppn != 0) {
        printer.row([
          PosColumn(
            text: taxName,
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
      num rounding = bulatkanKe500(grandTotalAfterTax) - grandTotalAfterTax;
      grandTotalAfterTax = bulatkanKe500(grandTotalAfterTax);
      printer.row([
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
      printer.row([
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
      printer.row([
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
        printer.hr();
        for (var resP in payMethod) {
          if (resP["method"] == 'Cash') {
            printer.row([
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

            printer.row([
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
            printer.row([
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

    printer.hr();
    printer.row([
      PosColumn(
        text: '$jumItem Item / $transactionNumber',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    // printer.row([
    //   PosColumn(
    //     text: '',
    //     width: 1,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    //   PosColumn(
    //     text: staffName,
    //     width: 10,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    //   PosColumn(
    //     text: '',
    //     width: 1,
    //     styles: const PosStyles(align: PosAlign.center),
    //   ),
    // ]);
    printer.row([
      PosColumn(
        text:
            'Your Order #${transactionNumber.substring(transactionNumber.length - 3)}',
        width: 12,
        styles: const PosStyles(align: PosAlign.left),
      ),
    ]);

    if (type != 'printDocket') {
      if (outletFB != '') {
        printer.row([
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: outletFB!,
            width: 10,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletIG != '') {
        printer.row([
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: outletIG!,
            width: 10,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletTIKTOK != '') {
        printer.row([
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: outletTIKTOK!,
            width: 10,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      if (outletWeb != '') {
        printer.row([
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: outletWeb!,
            width: 10,
            styles: const PosStyles(align: PosAlign.center),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles: const PosStyles(align: PosAlign.center),
          ),
        ]);
      }
      printer.feed(1);
      printer.row([
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: 'Powered by squadra.id',
          width: 10,
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(
          text: '',
          width: 1,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
    }
  }
  printer.feed(1);
  printer.cut();
}

List<String> wrapText(String text, int maxChars) {
  final List<String> lines = [];
  while (text.length > maxChars) {
    // cari spasi terakhir sebelum maxChars supaya tidak putus kata
    int breakIndex = text.lastIndexOf(' ', maxChars);
    if (breakIndex == -1) breakIndex = maxChars;
    lines.add(text.substring(0, breakIndex).trim());
    text = text.substring(breakIndex).trim();
  }
  if (text.isNotEmpty) lines.add(text);
  return lines;
}

void printQRTableLan(
    {String? url, String? label, int? number, dynamic ip}) async {
  const size = PaperSize.mm80;

  final prefs = await SharedPreferences.getInstance();
  final profile = await CapabilityProfile.load();
  final printer = NetworkPrinter(size, profile);
  final result = await printer.connect(ip, port: 9100);

  if (result == PosPrintResult.success) {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());

    String outletName = prefs.getString("outletName") ?? '';

    printer.reset();

    printer.row([
      PosColumn(
        text: outletName,
        width: 12,
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      ),
    ]);
    printer.row([
      PosColumn(
        text: '$date $tdata',
        width: 12,
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      ),
    ]);
    printer.row([
      PosColumn(
        text: 'Table : $number',
        width: 12,
        styles: const PosStyles(
          bold: true,
          align: PosAlign.center,
        ),
      ),
    ]);
    printer.hr();
    printer.feed(1);
    printer.qrcode(
      url ?? "",
      size: QRSize.Size8,
      align: PosAlign.center,
    );
    printer.feed(1);
    printer.text(
      'Scan QR Code untuk pesan.',
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    printer.cut();
  }
}
