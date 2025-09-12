import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_payment_method/g_payment_method.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_tax/g_tax.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_transaction_type/g_transaction_type.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu_detail/m_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_dialog.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class TransactionCheckOutSMController extends GetxController {
  TransactionCheckOutSMController(this.sMenuRepository, this.localStorage);

  final SMenuRepository sMenuRepository;
  final LocalStorage localStorage;

  final dbHelper = DatabaseHelper();

  final paymentMethod = <PaymentMethodLiteModel>[].obs;
  final transactionTypeJunc = <TransactionTypeLiteModel>[].obs;

  final nominalFocusNode = FocusNode();
  final nominalController = TextEditingController();
  RxBool isCheckedRound = false.obs;
  RxInt isPaymentMethodId = 0.obs;
  RxInt isTransactionTypeJuncId = 0.obs;
  RxString isPaymentMethodName = ''.obs;
  RxString taxName = ''.obs;
  RxDouble taxPercent = 0.0.obs;

  var status = RxStatus.empty().obs;

  void _getPaymentMethodLite() async {
    final result = await dbHelper.getPaymentMethodLite();

    paymentMethod.value =
        result.map((model) => PaymentMethodLiteModel.fromJson(model)).toList();
  }

  void _getTransactionTypeJuncLite() async {
    final transactionType = await dbHelper.getTransactionTypeJuncLite();

    transactionTypeJunc.value = transactionType
        .map((model) => TransactionTypeLiteModel.fromJson(model))
        .where((item) => item.chargeValue != 0)
        .toList();
  }

  int bulatkanKe500(int harga) {
    return ((harga + 499) ~/ 500) * 500;
  }

  void _getTax() async {
    final result = await dbHelper.getTax();
    taxPercent.value = result.isNotEmpty
        ? (TaxLiteModel.fromJson(result.first).taxPercent / 100)
        : 0;
    taxName.value =
        result.isNotEmpty ? TaxLiteModel.fromJson(result.first).taxName : '-';
  }

  void inputNominal(String number) {
    String currentText = nominalController.text.replaceAll('.', '');
    String text = currentText + number;
    int value = int.tryParse(text) ?? 0;

    nominalController.text = NumberFormat('#,###', 'id_ID').format(value);
  }

  void deleteNominal() {
    String currentText = nominalController.text.replaceAll('.', '');

    if (currentText.isNotEmpty) {
      String text = currentText.substring(0, currentText.length - 1);
      int value = int.tryParse(text) ?? 0;

      nominalController.text = value > 0
          ? NumberFormat('#,###', 'id_ID').format(value)
          : ''; // Format ulang
    }
  }

  Future<void> closeBillCall(
      {required int cartId,
      required int transactionId,
      required int amount,
      required int transactionTypeJuncID,
      required Map<String, dynamic> arguments,
      required int tableId,
      required int ppn,
      required int rounding,
      required int grandTotalFinal}) async {
    final header = arguments['header'] as TransactionSMHeaderData;

    if (isPaymentMethodName.isEmpty) {
      CustomDialog.show(Get.context!, "Please choose the payment type.");
      return;
    }

    final pay = nominalController.text.replaceAll('.', '');

    if (isPaymentMethodName.value == 'Cash') {
      if (pay.isEmpty) {
        CustomDialog.show(Get.context!, "Please enter the cash value.");
        return;
      } else {
        if (num.parse(pay) < (header.grandTotalFinal ?? 0)) {
          CustomDialog.show(Get.context!,
              "The cash value should be greater than the transaction value.");
          return;
        }
      }
    }

    if (header.transactionType == 'Delivery' && transactionTypeJuncID == 0) {
      CustomDialog.show(Get.context!, "Please choose the delivery type.");
      return;
    }

    status.value = RxStatus.loading();

    await Future.delayed(const Duration(seconds: 1));

    final paymentMethod = [
      {"method": isPaymentMethodName.value, "amount": amount, "pay": pay}
    ];
    final currentAppVersion = await PackageInfo.fromPlatform();

    final requestBody = {
      "cartID": cartId.toString(),
      "transactionID": transactionId.toString(),
      "paymentMethod": paymentMethod,
      "transactionTypeJuncID": isTransactionTypeJuncId.value,
      "ppn": ppn,
      "rounding": rounding,
      "grandTotalFinal": grandTotalFinal,
      "appVersion": currentAppVersion.version
    };
    print("body: ${requestBody}");
    final result = await sMenuRepository.postCheckOutSM(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) async {
        final statusAPI = json.decode(data)['status'];

        if (statusAPI == "success") {
          await dbHelper.updateUniqueNumberSM(tableId, 0, '');

          final argumentsExist = Map<String, dynamic>.from(arguments);
          argumentsExist['paymentMethod'] = paymentMethod;

          Get.offNamedUntil(
              RouteName.successPaymentSM, (route) => route.isFirst,
              arguments: argumentsExist,
              parameters: {
                'ppn': ppn.toString(),
                'rounding': rounding.toString(),
                'grandTotalFinal': grandTotalFinal.toString()
              });

          status.value = RxStatus.success();
        }
      },
      error: (data, url, headers, statusCode) {
        status.value = RxStatus.error();
        // status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        status.value = RxStatus.error();
        // final response = getContentErrorHTTP(exception);

        // status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  Future<void> handlePrintReceipt(
      Map<String, dynamic> args, ppn, grandTotalFinal, rounding) async {
    final primaryPrinter = await localStorage.getPrimaryPrinter();
    Generator generator;
    final profile = await CapabilityProfile.load();
    generator = Generator(PaperSize.mm58, profile);

    if (primaryPrinter.first == 'BluetoothPrinter') {
      if (!await PrintBluetoothThermal.connectionStatus) return;
      final profile = await CapabilityProfile.load();
      generator = Generator(PaperSize.mm58, profile);
      final bytes = await printReceiptCall(
          args, generator, ppn, grandTotalFinal, rounding);
      await PrintBluetoothThermal.writeBytes(bytes);
    } else {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);
      final response = await printer.connect(primaryPrinter[1], port: 9100);

      if (response != PosPrintResult.success) return;

      final generator = Generator(PaperSize.mm80, profile);
      final bytes = await printReceiptCall(
          args, generator, ppn, grandTotalFinal, rounding);
      printer.rawBytes(Uint8List.fromList(bytes));
      printer.disconnect();
    }
  }

  Future<List<int>> printReceiptCall(Map<String, dynamic> args,
      Generator generator, ppn, grandTotalFinal, rounding) async {
    // String dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    // String timeNow = DateFormat("HH:mm:ss").format(DateTime.now());

    // final profile = await CapabilityProfile.load();
    // Generator generator;

    // final outletName = await localStorage.getOutletName();
    // final outletImage = await localStorage.getImageUrl();
    // final staffName = await localStorage.getStaffName();

    final header = args['header'] as TransactionSMHeaderData?;
    final detail = args['detail'] as List<TransactionSMDetailData>;
    // final method = args['paymentMethod'];
    final method = args['paymentMethod'];
    final outletName = await localStorage.getOutletName();
    final outletImage = await localStorage.getImageUrl();
    final staffName = await localStorage.getStaffName();
    final outletFB = await localStorage.getOutletFB();
    final outletIG = await localStorage.getOutletIG();
    final outletTikTok = await localStorage.getOutletTiktok();
    final outletWeb = await localStorage.getOutletWeb();

    num discountTotal = 0;
    int totalItem = 0;

    String date = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.isoDate);
    String time = DateFormatter.format(
        date: DateTime.now(), pattern: DateFormatter.timeOnly);
    // final transactionOrderOfflineController =
    //     Get.find<OrderOfflineController>();
    // final taxName = header?.ppnName ?? '-';
    // final discountOnDetail = header?.discountOnDetail;
    // final paymentMethod = jsonDecode(header?.paymentMethod ?? '[]');

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
    if (header?.statusTransaction == 'Void') {
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

    // bytes += generator.hr();
    bytes += generator.text('Receipt',
        styles: PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA));
    bytes += generator.hr();

    // bytes += generator.feed(1);
    // bytes += generator.text(labelLine('Outlet', outletName, printPapers),
    //     styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA));

    bytes += generator.row([
      PosColumn(
        text: 'Created On :',
        width: 4, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.left,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
      PosColumn(
        text: '${header?.datetime}',
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
        text: 'Printed On :',
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
        text: 'Customer',
        width: 5, // setengah dari lebar total (12)
        styles: PosStyles(fontType: PosFontType.fontA, align: PosAlign.left),
      ),
      PosColumn(
        text: '${header?.customerName == '' ? '---' : header?.customerName}',
        width: 7,
        styles: PosStyles(
          fontType: PosFontType.fontA,
          align: PosAlign.right,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ),
      ),
    ]);
    if ((header?.transactionType ?? '').isNotEmpty) {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(
          text:
              '${header?.transactionType == 'Dine In' ? '${header?.transactionType} [Table ${header?.tableLabel}]' : header?.transactionType}',
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
    for (final data in detail) {
      final decoded = data.discountDetail;

      totalItem += data.qty ?? 0;

      for (final discount in decoded) {
        if (discount['discountTotal'] != null) {
          discountTotal += discount['discountTotal'] as num;
        }
      }

      bytes += generator.row([
        PosColumn(
            text: data.menuName ?? '--',
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
          text: numberFormatNoIDR(data.menuPrice ?? 0 * (data.qty ?? 0)),
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
                '-${numberFormatNoIDR(data.menuPrice ?? 0 * (data.qty ?? 0))}',
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
            text: '- ${value.menuName}',
            width: 8, // setengah dari lebar total (12)
            styles:
                PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(value.menuPrice ?? 0 * (data.qty ?? 0)),
            width: 4,
            styles:
                PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }

      if (data.notes != '') {
        // bytes += generator.text('Note Option : ${data.noteOption}',
        //     styles: const PosStyles(
        //         align: PosAlign.left, fontType: PosFontType.fontA));
        bytes += generator.row([
          PosColumn(
            text: 'Note : ${data.notes}',
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

      // // if (data.notes) {
      //   // bytes += generator.text('Notes : ${data.notes}',
      //   //     styles: const PosStyles(
      //   //         align: PosAlign.left, fontType: PosFontType.fontA));
      //   bytes += generator.row([
      //     PosColumn(
      //       text: 'Notes : ${data.notes}',
      //       width: 11, // setengah dari lebar total (12)
      //       styles:
      //           PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
      //     ),
      //     PosColumn(
      //       text: '',
      //       width: 1,
      //       styles:
      //           PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      //     ),
      //   ]);
      // }
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
        text: numberFormatNoIDR(header?.subTotal),
        width: 6,
        styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
      ),
    ]);

    if ((int.parse(ppn) ?? 0) > 0) {
      // bytes += generator.text(formatTwoColumnText(
      //     'Tax & Service', numberFormatNoIDR(transaction.first.ppn)));
      bytes += generator.row([
        PosColumn(
          text: 'PB 1',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(int.parse(ppn)),
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
        text: numberFormatNoIDR(int.parse(rounding)),
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
        text: numberFormatNoIDR(int.parse(grandTotalFinal)),
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

    // for (final data in paymentMethod) {
    if (method.first["method"] == 'Cash') {
//  method.first['method']
      bytes += generator.row([
        PosColumn(
          text: method.first["method"],
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(method.first["pay"]),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);

      bytes += generator.row([
        PosColumn(
          text: 'Change',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: numberFormatNoIDR(
              method.first["pay"] - int.parse(grandTotalFinal)),
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
    } else {
      // bytes += generator.text(formatTwoColumnText('Payment', data["method"]));
      bytes += generator.row([
        PosColumn(
          text: 'Payment',
          width: 6, // setengah dari lebar total (12)
          styles: PosStyles(align: PosAlign.left, fontType: PosFontType.fontA),
        ),
        PosColumn(
          text: method.first["method"],
          width: 6,
          styles: PosStyles(align: PosAlign.right, fontType: PosFontType.fontA),
        ),
      ]);
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
    bytes += generator.text(header?.transactionNumber ?? '---',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    // bytes +=
    //     generator.text(staffName, styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Your Order',
        styles: PosStyles(align: PosAlign.center, fontType: PosFontType.fontA));
    bytes += generator.text(
        '#${(header?.transactionNumber ?? '').substring((header?.transactionNumber ?? '').length - 3)}',
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
    // await PrintBluetoothThermal.writeBytes(bytes);
  }

  String formatTwoColumnText({String? left, String? right, int width = 32}) {
    int space = width - (left ?? '').length - (right ?? '').length;

    if (space < 0) space = 1;

    return '$left${' ' * space}$right';
  }

  @override
  void onInit() {
    super.onInit();
    _getTax();
    _getPaymentMethodLite();
    _getTransactionTypeJuncLite();
  }
}
