import 'dart:convert';
import 'dart:typed_data';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/refactor/data/models/transaction_report/m_transaction_report.dart';
import 'package:squadra_pos/refactor/data/providers/models/api_result.dart';
import 'package:squadra_pos/refactor/data/providers/models/network_exception.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_summary_report.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class SummaryReportController extends GetxController {
  SummaryReportController(
      this.localStorage, this.screenLockController, this.transactionRepository);

  final LocalStorage localStorage;
  final ScreenLockController screenLockController;
  final SummaryReportRepository transactionRepository;

  final scrollController = ScrollController();
  final reportList = TransactionReportModel().obs;

  final currentDate = <DateTime>[DateTime.now()].obs;

  final status = RxStatus.empty().obs;

  RxInt active = 1.obs;
  RxString filterTab = today.obs;
  RxString filterDate = dateDay(DateTime.now().toString()).obs;
  RxBool isBorder = false.obs;

  void selectDate(String date, DateTime dateTime) async {
    filterDate.value = date;
    currentDate[0] = dateTime;

    String dateParse = dateDefault(dateTime.toString());

    await summaryReportCall(filter: filterTab.value, date: dateParse);
  }

  String getValueText(
      CalendarDatePicker2Type datePickerType, List<DateTime?> values) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();

    final valueText = (values.isNotEmpty
            ? DateFormat('EEEE, dd MMMM yyyy', 'id-ID').format(values[0]!)
            : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    return valueText;
  }

  Future<void> summaryReportCall({String? filter, String? date}) async {
    status.value = RxStatus.loading();

    var requestBody = {
      "dateType": filter,
      "datetime": date,
    };

    ApiResult result =
        await transactionRepository.postSummaryReport(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) {
        final parsed = transactionReportFromJson(data);

        if (parsed != null) {
          reportList.value = parsed;

          status.value = RxStatus.success();
        }
      },
      error: (data, url, headers, statusCode) {
        status.value = RxStatus.error(jsonDecode(data)["message"]);
      },
      failure: (exception) {
        final response = getContentErrorHTTP(exception);

        status.value = RxStatus.error(response["error_type"]);
      },
    );
  }

  void handleFilterTap({required String value, required int tabIndex}) async {
    active.value = tabIndex;
    filterTab.value = value;

    String dateParse = dateDefault(currentDate[0].toString());

    await summaryReportCall(filter: filterTab.value, date: dateParse);
  }

  void rebuild({required String value}) async {
    await summaryReportCall(filter: value);

    refresh();
  }

  void onScroll() async {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;

    isBorder.value = position.pixels > position.minScrollExtent;
  }

  void handlePrintSummary(
      {required String type,
      List<PaymentMethod>? payment,
      List<Product>? product,
      required int tax,
      required int total,
      int? rounding,
      int? discount}) async {
    List<String> printer = await localStorage.getPrimaryPrinter();

    if (printer.isNotEmpty && printer[0] == 'BluetoothPrinter') {
      printSummary(
          type: type,
          payment: payment,
          product: product,
          tax: tax,
          total: total,
          rounding: rounding,
          discount: discount,
          printers: 'Bluetooth');
    } else {
      printSummary(
          type: type,
          payment: payment,
          product: product,
          tax: tax,
          total: total,
          rounding: rounding,
          discount: discount,
          printers: 'LAN',
          printIP: printer[1]);
    }
  }

  void printSummary(
      {required String type,
      List<PaymentMethod>? payment,
      List<Product>? product,
      required int tax,
      required int total,
      int? rounding,
      int? discount,
      String? printers,
      String? printIP}) async {
    if (printers == 'Bluetooth') {
      final profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);
      bool connected = await PrintBluetoothThermal.connectionStatus;

      if (!connected) return;
      final receipt = await generateReceipt(
          rePrint: 1,
          summaryType: type,
          payment: payment,
          product: product,
          tax: tax,
          total: total,
          generator: generator,
          rounding: rounding,
          discount: discount,
          printers: printers!,
          printIP: printIP);
      await PrintBluetoothThermal.writeBytes(receipt);
    } else {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);
      final connectResult = await printer.connect(printIP!, port: 9100);
      if (connectResult == PosPrintResult.success) {
        final generator = Generator(PaperSize.mm80, profile);
        final receipt = await generateReceipt(
            rePrint: 1,
            summaryType: type,
            payment: payment,
            product: product,
            tax: tax,
            total: total,
            generator: generator,
            rounding: rounding,
            discount: discount,
            printers: printers!,
            printIP: printIP);

        printer.rawBytes(Uint8List.fromList(receipt));
        await Future.delayed(const Duration(milliseconds: 300));
        printer.disconnect();
      } else {
        debugPrint("❌ Printer connection failed: ${connectResult}");
      }
    }
  }

  Future<List<int>> generateReceipt(
      {required int rePrint,
      required String summaryType,
      List<PaymentMethod>? payment,
      List<Product>? product,
      required int tax,
      required int total,
      required Generator generator,
      int? rounding,
      int? discount,
      required String printers,
      String? printIP}) async {
    // final profile = await CapabilityProfile.load();
    final outletName = await localStorage.getOutletName();
    final dateNow = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final timeNow = DateFormat("HH:mm:ss").format(DateTime.now());

    List<int> bytes = [];
    bytes += (generator.row([
      PosColumn(
        text: outletName,
        width: 12,
        styles: const PosStyles(
            align: PosAlign.center, bold: true, fontType: PosFontType.fontA),
      ),
    ]));
    bytes += (generator.feed(1));
    void printHeader() {
      if (rePrint == 1) {
        if (summaryType == 'product_sold') {
          bytes += generator.row([
            PosColumn(
              text: 'Sales Summary',
              width: 12,
              styles: const PosStyles(
                  align: PosAlign.center,
                  bold: true,
                  fontType: PosFontType.fontA),
            ),
          ]);
        } else {
          bytes += generator.row([
            PosColumn(
              text: 'Payment Summary',
              width: 12,
              styles: const PosStyles(
                  align: PosAlign.center,
                  bold: true,
                  fontType: PosFontType.fontA),
            ),
          ]);
        }
      }

      bytes
        ..addAll(generator.row([
          PosColumn(
            text: '$filterDate',
            width: 12,
            styles: const PosStyles(
                align: PosAlign.center, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.hr());
    }

    void printPaymentSummary() {
      print(payment);
      if (payment == null) return;

      for (final item in payment) {
        bytes += generator.row([
          PosColumn(
            text: '${item.total} x ${item.method}',
            width: 6,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(item.totalAmount),
            width: 6,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }

      bytes
        ..addAll(generator.feed(1))
        ..addAll(generator.row([
          PosColumn(
            text: 'Total Tax',
            width: 7,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(tax),
            width: 5,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.row([
          PosColumn(
            text: 'Grand Total',
            width: 7,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(total),
            width: 5,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]));
    }

    void printProductSummary() {
      if (product == null) return;

      final main = product
          .where((item) => item.typeProduct?.toLowerCase() == 'main')
          .toList();
      final addOn = product
          .where((item) => item.typeProduct?.toLowerCase() == 'add on')
          .toList();
      final subTotal = total - (rounding ?? 0) + (discount ?? 0);

      bytes
        ..addAll(generator.row([
          PosColumn(
            text: 'Product',
            width: 12,
            styles: const PosStyles(
                align: PosAlign.center, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.hr());

      for (final item in main) {
        final totalPrice = int.tryParse(item.totalPrice ?? '0') ?? 0;

        bytes += generator.row([
          PosColumn(
            text: '${item.menuName}',
            width: 12,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
        ]);
        bytes += generator.row([
          PosColumn(
            text: '${item.totalQty}X',
            width: 6,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(totalPrice),
            width: 6,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }
      bytes
        ..addAll(generator.hr())
        ..addAll(generator.row([
          PosColumn(
            text: 'Add-On',
            width: 12,
            styles: const PosStyles(
                align: PosAlign.center, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.hr());

      for (final item in addOn) {
        final totalPrice = int.tryParse(item.totalPrice ?? '0') ?? 0;

        bytes += generator.row([
          PosColumn(
            text: '${item.menuName}',
            width: 12,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
        ]);
        bytes += generator.row([
          PosColumn(
            text: '${item.totalQty}X',
            width: 6,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(totalPrice),
            width: 6,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]);
      }
      bytes
        ..addAll(generator.feed(1))
        ..addAll(generator.row([
          PosColumn(
            text: 'Total',
            width: 6,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(subTotal),
            width: 6,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.row([
          PosColumn(
            text: 'Total Discount',
            width: 7,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(discount ?? 0),
            width: 5,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.row([
          PosColumn(
            text: 'Total Tax',
            width: 7,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(tax ?? 0),
            width: 5,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.row([
          PosColumn(
            text: 'Total Rounding',
            width: 7,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(rounding ?? 0),
            width: 5,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]))
        ..addAll(generator.row([
          PosColumn(
            text: 'Grand Total',
            width: 6,
            styles: const PosStyles(
                align: PosAlign.left, fontType: PosFontType.fontA),
          ),
          PosColumn(
            text: numberFormatNoIDR(total),
            width: 6,
            styles: const PosStyles(
                align: PosAlign.right, fontType: PosFontType.fontA),
          ),
        ]));
    }

    bytes += generator.reset();

    printHeader();

    if (summaryType == payments) {
      printPaymentSummary();
    } else if (summaryType == products) {
      printProductSummary();
    }
    bytes += generator.feed(1);
    bytes += generator.row([
      PosColumn(
        text: 'Printed On : $dateNow $timeNow',
        width: 12, // setengah dari lebar total (12)
        styles: PosStyles(
          fontType: PosFontType.fontB,
          align: PosAlign.center,
        ),
      ),
    ]);
    bytes += generator.feed(1);
    bytes += generator.cut();
    return bytes;
  }

  @override
  void onInit() {
    super.onInit();

    // currentDate.add(DateTime.now());
    scrollController.addListener(onScroll);
  }

  @override
  void onClose() {
    scrollController.dispose();

    super.onClose();
  }
}
