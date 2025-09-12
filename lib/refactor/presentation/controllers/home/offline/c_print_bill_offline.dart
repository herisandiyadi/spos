import 'dart:io';
import 'dart:typed_data';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction/g_transaction.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_detail/g_transaction_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class PrintBillOfflineController extends GetxController {
  PrintBillOfflineController(this._localStorage);

  final LocalStorage _localStorage;
  final _dbHelper = DatabaseHelper();

  void printBillBluetooth({required String transactionNumber}) async {
    if (!await PrintBluetoothThermal.connectionStatus) return;

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);
    final bytes = await generateBillBytes(
        trx: transactionNumber,
        generator: generator,
        isImage: true,
        printPapers: 'bluetooth');

    await PrintBluetoothThermal.writeBytes(bytes);
  }

  void printBillLan(
      {required String transactionNumber, required String printerIP}) async {
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(PaperSize.mm80, profile);
    final response = await printer.connect(printerIP, port: 9100);

    if (response != PosPrintResult.success) return;

    final generator = Generator(PaperSize.mm80, profile);

    final bytes = await generateBillBytes(
        trx: transactionNumber,
        generator: generator,
        isImage: true,
        printPapers: 'lan');
    printer.rawBytes(Uint8List.fromList(bytes));
    printer.disconnect();
  }

  Future<List<int>> generateBillBytes(
      {required String trx,
      required Generator generator,
      bool isImage = true,
      required String printPapers}) async {
    final transaction = await _dbHelper.getTransSpec(transactionNumber: trx);
    final transactionList =
        transaction.map((e) => TransactionLiteModel.fromJson(e)).toList();
    final transactionDetail =
        await _dbHelper.getTransactionDetail(transactionNumber: trx);
    var transactionDetailList = transactionDetail
        .map((e) => TransactionDetailLiteModel.fromJson(e))
        .toList();
    final controller = Get.find<OrderOfflineController>();
    for (int i = 0; i < transactionDetailList.length; i++) {
      final data = transactionDetailList[i];
      final addOn =
          await _dbHelper.getTransactionDetailAddOn(data.transactionDetailID);

      transactionDetailList[i] = data.copyWith(addOn: addOn);
    }

    final outletName = await _localStorage.getOutletName();
    final outletImage = await _localStorage.getImageUrl();
    final staffName = await _localStorage.getStaffName();
    final outletFB = await _localStorage.getOutletFB();
    final outletIG = await _localStorage.getOutletIG();
    final outletTikTok = await _localStorage.getOutletTiktok();
    final outletWeb = await _localStorage.getOutletWeb();

    String date = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.isoDate);
    String time = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.timeOnly);

    int totalItem = 0;
    num totalDisc = 0;

    final first = transactionList.first;
    final table = first.tableLabel ?? '---';
    final type = first.transactionType ?? '---';
    final name = first.customerName ?? '---';
    final unique =
        first.transactionNumber!.substring(first.transactionNumber!.length - 3);

    List<int> bytes = [];
    bytes += generator.reset();

    // :: Header
    if (isImage && outletImage.isNotEmpty) {
      final Uint8List imageBytes = await File(outletImage).readAsBytes();
      final img.Image? image = img.decodeImage(imageBytes);
      if (image != null) {
        final resized = img.copyResize(image, width: 200);
        bytes += generator.image(resized, align: PosAlign.center);
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
    bytes += generator.text('Bill',
        styles: PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA));
    bytes += generator.text('THIS IS NOT RECEIPT',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.hr();

    // bytes +=
    //     generator.text(outletName, styles: PosStyles(align: PosAlign.center));

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
        text: '${first.datetime}',
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

    bytes += generator.row([
      PosColumn(
        text: labelFixed('Customer', printPapers),
        width: 5, // setengah dari lebar total (12)
        styles: PosStyles(fontType: PosFontType.fontA, align: PosAlign.left),
      ),
      PosColumn(
        text: '${first.customerName ?? '---'}',
        width: 7,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    if ((first.transactionType ?? '').isNotEmpty) {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text:
              '${first.transactionType == 'Dine In' ? '${first.transactionType} [Table ${first.tableLabel}]' : first.transactionType}',
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

    // :: Item list
    for (final data in transactionDetailList) {
      final int qty = data.qty;
      final decoded = data.discountDetail;

      totalItem += data.qty;

      if (decoded.isNotEmpty) {
        for (final discount in decoded) {
          if (discount['discountTotal'] != null) {
            final int discountTotal = discount['discountTotal'] ?? 0;

            totalDisc += discountTotal * qty;
          }
        }
      }

      // bytes += generator.text(data.menuName,
      //     styles: const PosStyles(align: PosAlign.left));
      // bytes += generator.row([
      //   PosColumn(
      //       text: data.menuName,
      //       width: 12,
      //       styles: const PosStyles(
      //           align: PosAlign.left, fontType: PosFontType.fontA))
      // ]);
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
      // bytes += generator.text(
      //   formatTwoColumnText(
      //       '${data.qty} x ${numberFormatNoIDR(data.menuPrice)}',
      //       numberFormatNoIDR(data.menuPrice * data.qty)),
      // );
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
        // bytes += generator.text(
        //   formatTwoColumnText('(Discount)',
        //       '-${numberFormatNoIDR(data.menuPriceAfterDiscount * data.qty)}'),
        // );
        bytes += generator.row([
          PosColumn(
            text: '(Discount)',
            width: 6, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text:
                '-${numberFormatNoIDR((data.menuPrice * data.qty - data.menuPriceAfterDiscount * data.qty))}',
            width: 6,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }
      for (final value in data.addOn) {
        // bytes += generator.text(
        //   formatTwoColumnText('- ${value['menuName']}',
        //       numberFormatNoIDR(value['menuPrice'] * data.qty)),
        // );
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
        // bytes += generator.text('Notes : ${data.notes}');
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
    bytes += generator.hr();

    final grandTotal = !controller.isCheckedRound.value
        ? first.subTotal + first.ppn - (totalDisc + first.discountTotal).toInt()
        : bulatkanKe500(first.subTotal +
            first.ppn -
            (totalDisc + first.discountTotal).toInt());
    final totalDue = grandTotal;
    final rounding = !controller.isCheckedRound.value
        ? 0
        : grandTotal -
            (first.subTotal +
                first.ppn -
                (totalDisc + first.discountTotal).toInt());

    // :: Footer

    // bytes += generator.text(
    //     formatTwoColumnText('Subtotal', numberFormatNoIDR(first.subTotal)));

    bytes += generator.row([
      PosColumn(
        text: 'Subtotal',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(first.subTotal),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    if ((totalDisc + first.discountTotal) > 0) {
      // bytes += generator.text(formatTwoColumnText('Discount Total',
      //     numberFormatNoIDR(totalDisc + first.discountTotal)));
      bytes += generator.row([
        PosColumn(
          text: 'Discount Total',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(totalDisc + first.discountTotal),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }
    if (first.ppn > 0) {
      // bytes += generator
      //     .text(formatTwoColumnText('Tax (PB1)', numberFormatNoIDR(first.ppn)));
      bytes += generator.row([
        PosColumn(
          text: first.ppnName ?? '-',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(first.ppn),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    }
    // bytes += generator
    //     .text(formatTwoColumnText('Round', numberFormatNoIDR(rounding)));

    bytes += generator.row([
      PosColumn(
        text: 'Round',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(rounding),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    // bytes += generator.text(
    //     formatTwoColumnText('Grand Total', numberFormatNoIDR(grandTotal)));
    bytes += generator.row([
      PosColumn(
        text: 'Grand Total',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(grandTotal),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    // bytes += generator
    //     .text(formatTwoColumnText('Total Due', numberFormatNoIDR(totalDue)));
    bytes += generator.row([
      PosColumn(
        text: 'Total Due',
        width: 6, // setengah dari lebar total (12)
        styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      ),
      PosColumn(
        text: numberFormatNoIDR(totalDue),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);
    bytes += generator.hr();

    // :: Footer
    // bytes += generator.text('$totalItem Item',
    //     styles: PosStyles(align: PosAlign.center));
    // bytes += generator.hr();
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
    bytes += generator.text(first.transactionNumber ?? '---',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    // bytes +=
    //     generator.text(staffName, styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Your Order',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.text('#$unique',
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
