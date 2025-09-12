import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class PrintReceiptOfflineController extends GetxController {
  PrintReceiptOfflineController(this._localStorage);

  final LocalStorage _localStorage;

  void printReceiptBluetooth(
      {required List<TransactionLiteModel> transaction,
      required List<TransactionDetailLiteModel> transactionDetail}) async {
    if (!await PrintBluetoothThermal.connectionStatus) return;

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final bytes = await generateBillBytes(
        transaction: transaction,
        transactionDetail: transactionDetail,
        generator: generator,
        isImage: true,
        printPapers: 'bluetooth');

    await PrintBluetoothThermal.writeBytes(bytes);
  }

  void printReceiptLan(
      {required List<TransactionLiteModel> transaction,
      required List<TransactionDetailLiteModel> transactionDetail,
      required String printerIP}) async {
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(PaperSize.mm80, profile);
    final response = await printer.connect(printerIP, port: 9100);

    if (response != PosPrintResult.success) return;

    final generator = Generator(PaperSize.mm80, profile);
    final bytes = await generateBillBytes(
        transaction: transaction,
        transactionDetail: transactionDetail,
        generator: generator,
        isImage: true,
        printPapers: 'lan');

    printer.rawBytes(Uint8List.fromList(bytes));
    printer.disconnect();
  }

  Future<List<int>> generateBillBytes(
      {required List<TransactionLiteModel> transaction,
      required List<TransactionDetailLiteModel> transactionDetail,
      required Generator generator,
      bool isImage = true,
      required String printPapers}) async {
    final outletName = await _localStorage.getOutletName();
    final outletImage = await _localStorage.getImageUrl();
    final staffName = await _localStorage.getStaffName();
    final outletFB = await _localStorage.getOutletFB();
    final outletIG = await _localStorage.getOutletIG();
    final outletTikTok = await _localStorage.getOutletTiktok();
    final outletWeb = await _localStorage.getOutletWeb();

    num discountTotal = 0;
    int totalItem = 0;

    String date = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.isoDate);
    String time = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.timeOnly);
    // final transactionOrderOfflineController =
    //     Get.find<OrderOfflineController>();
    final taxName = transaction.first.ppnName ?? '-';
    final discountOnDetail = transaction.first.discountOnDetail;
    final paymentMethod = jsonDecode(transaction.first.paymentMethod ?? '[]');

    // final profile = await CapabilityProfile.load();
    // final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];

    bytes += generator.reset();

    if (outletImage.isNotEmpty) {
      final Uint8List imageBytes = await File(outletImage).readAsBytes();
      final img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        final resizedImage = img.copyResize(image, width: 200);
        bytes += generator.image(resizedImage, align: PosAlign.center);
      }
    }
    bytes += generator.row([
      PosColumn(
        text: '${outletName}',
        width: 12,
        styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: true,
            align: PosAlign.center),
      ),
    ]);
    bytes += generator.feed(1);
    if (transaction.first.statusTransaction == 'Void') {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text: 'TRANSACTION VOID',
          width: 12,
          styles: const PosStyles(
              align: PosAlign.center,
              bold: true,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              fontType: PosFontType.fontA),
        ),
      ]);
      bytes += generator.hr();
    }

    if (transaction.first.statusReceipt == 1) {
      // bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text: 'Re-print Receipt',
          width: 12,
          styles: const PosStyles(
              align: PosAlign.center,
              bold: true,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              fontType: PosFontType.fontA),
        ),
      ]);
      bytes += generator.hr();
    } else {
      // bytes += generator.hr();
      bytes += generator.text('Receipt',
          styles: PosStyles(
              align: PosAlign.center, bold: true, fontType: PosFontType.fontA));
      bytes += generator.hr();
    }

    // bytes += generator.feed(1);
    // bytes += generator.text(labelLine('Outlet', outletName, printPapers),
    //     styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA));

    bytes += generator.row([
      PosColumn(
        text: labelFixed('Created On :', printPapers),
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: '${transaction.first.datetime}',
        width: 8,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: labelFixed('Printed On :', printPapers),
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: '$date $time',
        width: 8,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);

    // if ((transaction.first.tableLabel ?? '').isNotEmpty) {
    //   // bytes += generator.text('Table : ${transaction.first.tableLabel}',
    //   //     styles: PosStyles(align: PosAlign.center, bold: true));

    //   bytes += generator.row([
    //     PosColumn(
    //       text: 'Table',
    //       width: 4, // setengah dari lebar total (12)
    //       styles: PosStyles(
    //         fontType: PosFontType.fontA,
    //         align: PosAlign.left,
    //         height: PosTextSize.size1,
    //         width: PosTextSize.size1,
    //       ),
    //     ),
    //     PosColumn(
    //       text: '${transaction.first.tableLabel}',
    //       width: 8,
    //       styles: PosStyles(
    //         fontType: PosFontType.fontA,
    //         align: PosAlign.right,
    //         height: PosTextSize.size1,
    //         width: PosTextSize.size1,
    //       ),
    //     ),
    //   ]);
    // }

    // bytes += generator.text(transaction.first.transactionType ?? '---',
    //     styles: PosStyles(align: PosAlign.center));

    // bytes += generator.text(transaction.first.customerName ?? '---',
    //     styles: PosStyles(align: PosAlign.center));
    bytes += generator.row([
      PosColumn(
        text: labelFixed('Customer', printPapers),
        width: 5, // setengah dari lebar total (12)
        styles: PosStyles(fontType: PosFontType.fontA, align: PosAlign.left),
      ),
      PosColumn(
        text: '${transaction.first.customerName ?? '---'}',
        width: 7,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    if ((transaction.first.transactionType ?? '').isNotEmpty) {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text:
              '${transaction.first.transactionType == 'Dine In' ? '${transaction.first.transactionType} [Table ${transaction.first.tableLabel}]' : transaction.first.transactionType}',
          width: 12,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            align: PosAlign.center,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
      ]);

      bytes += generator.hr();
    }

    // :: List cart
    for (final data in transactionDetail) {
      final decoded = data.discountDetail;

      totalItem += data.qty;

      for (final discount in decoded) {
        if (discount['discountTotal'] != null) {
          discountTotal += discount['discountTotal'] as num;
        }
      }

      bytes += generator.row([
        PosColumn(
            text: data.menuName,
            width: 11,
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA)),
        PosColumn(
            text: '',
            width: 1,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA))
      ]);

      // bytes += generator.text(formatTwoColumnText(
      //     '${data.qty} x ${numberFormatNoIDR(data.menuPrice)}',
      //     numberFormatNoIDR(data.menuPrice * data.qty)));

      bytes += generator.row([
        PosColumn(
          text: '${data.qty} x ${numberFormatNoIDR(data.menuPrice)}',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(data.menuPrice * data.qty),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
      if (data.discountDetail.isNotEmpty) {
        // bytes += generator.text(formatTwoColumnText('(Discount)',
        //     '-${numberFormatNoIDR(data.menuPriceAfterDiscount * data.qty)}'));
        bytes += generator.row([
          PosColumn(
            text: '(Discount)',
            width: 6, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text:
                '-${numberFormatNoIDR(data.menuPriceAfterDiscount * data.qty)}',
            width: 6,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }

      for (final value in data.addOn) {
        // bytes += generator.text(formatTwoColumnText('- ${value['menuName']}',
        //     numberFormatNoIDR(value['menuPrice'] * data.qty)));

        bytes += generator.row([
          PosColumn(
            text: '- ${value['menuName']}',
            width: 8, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(value['menuPrice'] * data.qty),
            width: 4,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }

      if (data.noteOption.isNotEmpty) {
        // bytes += generator.text('Note Option : ${data.noteOption}',
        //     styles: const PosStyles(
        //         align: PosAlign.left, fontType: PosFontType.fontA));
        bytes += generator.row([
          PosColumn(
            text: 'Note Option : ${data.noteOption}',
            width: 11, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }

      if (data.notes.isNotEmpty) {
        // bytes += generator.text('Notes : ${data.notes}',
        //     styles: const PosStyles(
        //         align: PosAlign.left, fontType: PosFontType.fontA));
        bytes += generator.row([
          PosColumn(
            text: 'Notes : ${data.notes}',
            width: 11, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: '',
            width: 1,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }
      bytes += generator.feed(1);
    }
    // bytes += generator.feed(1);
    bytes += generator.hr();
    // bytes += generator.text(formatTwoColumnText(
    //     'Subtotal',
    //     numberFormatNoIDR(discountOnDetail.isNotEmpty
    //         ? transaction.first.subTotal
    //         : transaction.first.subTotal)));
    bytes += generator.row([
      PosColumn(
        text: 'Subtotal',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(discountOnDetail.isNotEmpty
            ? transaction.first.subTotal
            : transaction.first.subTotal),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    if ((discountTotal + transaction.first.discountTotal) > 0) {
      // bytes += generator.text(formatTwoColumnText('Discount Total',
      //     numberFormatNoIDR(transaction.first.discountTotal)));
      bytes += generator.row([
        PosColumn(
          text: 'Discount Total',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(transaction.first.discountTotal),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }

    if (transaction.first.ppn > 0) {
      // bytes += generator.text(formatTwoColumnText(
      //     'Tax & Service', numberFormatNoIDR(transaction.first.ppn)));
      bytes += generator.row([
        PosColumn(
          text: taxName,
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(transaction.first.ppn),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }

    // bytes += generator.text(formatTwoColumnText(
    //     'Round', numberFormatNoIDR(transaction.first.rounding)));
    bytes += generator.row([
      PosColumn(
        text: 'Round',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(transaction.first.rounding),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    // bytes += generator.text(formatTwoColumnText(
    //     'Grand Total', numberFormatNoIDR(transaction.first.grandTotalFinal)));
    bytes += generator.row([
      PosColumn(
        text: 'Grand Total',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(transaction.first.grandTotalFinal),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    // bytes +=
    //     generator.text(formatTwoColumnText('Total Due', numberFormatNoIDR(0)));
    bytes += generator.row([
      PosColumn(
        text: 'Total Due',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(0),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    bytes += generator.hr();

    for (final data in paymentMethod) {
      if (data["method"] == 'Cash') {
        // bytes += generator.text(formatTwoColumnText(
        //     data["method"], numberFormatNoIDR(data["pay"])));
        bytes += generator.row([
          PosColumn(
            text: data["method"],
            width: 6, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(data["pay"]),
            width: 6,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
        // bytes += generator.text(formatTwoColumnText(
        //     'Change',
        //     numberFormatNoIDR(
        //         data["pay"] - transaction.first.grandTotalFinal)));
        bytes += generator.row([
          PosColumn(
            text: 'Change',
            width: 6, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(
                data["pay"] - transaction.first.grandTotalFinal),
            width: 6,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      } else {
        // bytes += generator.text(formatTwoColumnText('Payment', data["method"]));
        bytes += generator.row([
          PosColumn(
            text: 'Payment',
            width: 6, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: data["method"],
            width: 6,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: '#$totalItem Item',
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontB),
      ),
      PosColumn(
        text: staffName,
        width: 8,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontB),
      ),
    ]);
    bytes += generator.feed(1);
    // bytes += generator.text('$totalItem Item',
    //     styles: PosStyles(align: PosAlign.center));
    bytes += generator.text(transaction.first.transactionNumber ?? '---',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    // bytes +=
    //     generator.text(staffName, styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Your Order',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.text(
        '#${(transaction.first.transactionNumber ?? '').substring((transaction.first.transactionNumber ?? '').length - 3)}',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));

    for (final socmed in [outletFB, outletIG, outletTikTok, outletWeb]) {
      if (socmed.isNotEmpty) {
        bytes += generator.text(socmed,
            styles:
                PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
      }
    }

    bytes += generator.feed(1);
    bytes += generator.text('Powered by squadra.id',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.cut();

    return bytes;
  }

  String labelFixed(String label, String printPapers) {
    final int targetLength = printPapers == 'lan' ? 14 : 12;
    return label.padRight(targetLength);
  }

  String labelLine(String label, String value, String printPapers) {
    String paper = printPapers == 'lan' ? '80mm' : '58mm';
    final maxLen = (paper == '80mm') ? 48 : 32; // 48 char for 80mm, 32 for 58mm
    final fixedLabel = label.padRight(14); // bisa kamu ubah sesuai font
    final line = '$fixedLabel: $value';
    return line.length > maxLen ? line.substring(0, maxLen) : line;
  }
}
