import 'dart:convert';
import 'dart:typed_data';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/printer/print_lan.dart';
import 'package:squadra_pos/refactor/data/models/transaction_smenu/m_transaction_sm.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/routes/app_routes.dart';
import 'package:squadra_pos/refactor/utils/formatter_date.dart';

class CreateTransactionSMController extends GetxController {
  CreateTransactionSMController(
      this.localStorage, this.sMenuRepository, this.reserveOfflineController);

  final LocalStorage localStorage;
  final SMenuRepository sMenuRepository;
  final ReserveOfflineController reserveOfflineController;

  final dbHelper = DatabaseHelper();
  final transactionSMList = <TransactionSMData>[].obs;

  Future<void> printQRTableHandle(url, tableLabel, tableNum, reprint) async {
    final primaryPrinter = await localStorage.getPrimaryPrinter();
    Generator generator;
    final profile = await CapabilityProfile.load();
    generator = Generator(PaperSize.mm58, profile);

    if (primaryPrinter.first == 'BluetoothPrinter') {
      if (!await PrintBluetoothThermal.connectionStatus) return;
      final profile = await CapabilityProfile.load();
      generator = Generator(PaperSize.mm58, profile);
      final bytes =
          await printQRTable(url, tableLabel, tableNum, reprint, generator);
      await PrintBluetoothThermal.writeBytes(bytes);
    } else {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);
      final response = await printer.connect(primaryPrinter[1], port: 9100);

      if (response != PosPrintResult.success) return;

      generator = Generator(PaperSize.mm80, profile);
      final bytes =
          await printQRTable(url, tableLabel, tableNum, reprint, generator);
      printer.rawBytes(Uint8List.fromList(bytes));
      printer.disconnect();
    }
  }

  Future<void> createTransactionSM(
      {required int tableId,
      required String tableLabel,
      required int tableNumber,
      bool init = false}) async {
    final outletCode = await localStorage.getOutletCode();
    // final primaryPrinter = await localStorage.getPrimaryPrinter();

    var requestBody = {"OutletCode": outletCode, "TableID": tableId};

    final result =
        await sMenuRepository.postCreateTransactionSM(body: requestBody);

    result.when(
      success: (data, url, headers, statusCode) async {
        final status = json.decode(data)['status'];

        if (status == "error") {
          showDialogMessage(message: json.decode(data)['message']);
          return;
        }

        final response = json.decode(data)['data'];
        final qrUrl = response["url"]?.toString() ?? '';

        final transactionJson = {
          "data": response["transactions"],
        };
        final transactionParsed = json.encode(transactionJson);
        final transactionData = transactionSMFromJson(transactionParsed);
        final transactionItems = transactionData?.data ?? [];

        if (transactionItems.isNotEmpty && qrUrl.isNotEmpty) {
          final datetime = DateFormatter.format(
              date: DateTime.now(), pattern: DateFormatter.fullDateTime);
          await dbHelper.updateUniqueNumberSM(
              tableId, transactionItems.first.uniqeNumber ?? 0, datetime);

          final primaryPrinter = await localStorage.getPrimaryPrinter();
          Generator generator;
          final profile = await CapabilityProfile.load();
          generator = Generator(PaperSize.mm58, profile);

          if (primaryPrinter.first == 'BluetoothPrinter') {
            if (!await PrintBluetoothThermal.connectionStatus) return;
            final profile = await CapabilityProfile.load();
            generator = Generator(PaperSize.mm58, profile);
            final bytes = await printQRTable(
                qrUrl, tableLabel, tableNumber, true, generator);
            await PrintBluetoothThermal.writeBytes(bytes);
          } else {
            final profile = await CapabilityProfile.load();
            final printer = NetworkPrinter(PaperSize.mm80, profile);
            final response =
                await printer.connect(primaryPrinter[1], port: 9100);

            if (response != PosPrintResult.success) return;

            generator = Generator(PaperSize.mm80, profile);
            final bytes = await printQRTable(
                qrUrl, tableLabel, tableNumber, true, generator);
            printer.rawBytes(Uint8List.fromList(bytes));
            printer.disconnect();
          }
          // if (primaryPrinter.first == 'BluetoothPrinter') {
          //   printQRTableBluetooth(
          //       url: qrUrl,
          //       label: tableLabel,
          //       number: tableNumber,
          //       reprint: false);
          // } else {
          //   printQRTableLan(
          //       url: qrUrl,
          //       label: tableLabel,
          //       number: tableNumber,
          //       ip: primaryPrinter.first,
          //       reprint: false);
          // }

          if (init) {
            await reserveOfflineController.initLocationAndTables();

            Get.offNamedUntil(RouteName.orderSM, (route) => route.isFirst,
                arguments: {
                  "unique_number": transactionItems.first.uniqeNumber ?? 0,
                });
          }
        }
      },
      error: (data, url, headers, statusCode) {
        print(data);
        // final message = json.decode(data)['message'];
      },
      failure: (exception) {
        print(exception);
        // final response = getContentErrorHTTP(exception);
      },
    );
  }

  void showDialogMessage({String? message}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Information'),
          content: Text(message ?? '---'),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  // void printQRTableBluetooth(
  //     {required String url,
  //     String? label,
  //     int? number,
  //     required bool reprint}) async {
  //   bool connected = await PrintBluetoothThermal.connectionStatus;

  //   if (!connected) return;

  //   final dateNow = DateFormatter.format(
  //       date: DateTime.now(), pattern: DateFormatter.isoDate);
  //   final timeNow = DateFormatter.format(
  //       date: DateTime.now(), pattern: DateFormatter.timeOnly);

  //   final profile = await CapabilityProfile.load();

  //   Generator generator;

  //   final outletName = await localStorage.getOutletName();

  //   generator = Generator(PaperSize.mm58, profile);
  //   List<int> bytes = [];

  //   bytes += generator.reset();

  //   if (!reprint) {
  //     bytes += generator.row([
  //       PosColumn(
  //         text: "Reprint",
  //         width: 12,
  //         styles: const PosStyles(
  //           align: PosAlign.center,
  //         ),
  //       ),
  //     ]);
  //   }

  //   bytes += generator.row([
  //     PosColumn(
  //       text: outletName,
  //       width: 12,
  //       styles: const PosStyles(
  //         align: PosAlign.center,
  //       ),
  //     ),
  //   ]);
  //   bytes += generator.row([
  //     PosColumn(
  //       text: '$dateNow $timeNow',
  //       width: 12,
  //       styles: const PosStyles(
  //         align: PosAlign.center,
  //       ),
  //     ),
  //   ]);
  //   bytes += generator.row([
  //     PosColumn(
  //       text: 'Table : $number',
  //       width: 12,
  //       styles: const PosStyles(
  //         bold: true,
  //         align: PosAlign.center,
  //       ),
  //     ),
  //   ]);
  //   bytes += generator.hr();
  //   bytes += generator.feed(1);
  //   bytes += generator.qrcode(
  //     url,
  //     size: QRSize.Size8,
  //     align: PosAlign.center,
  //   );
  //   bytes += generator.feed(1);
  //   bytes += generator.text(
  //     'Scan QR Code untuk pesan.',
  //     styles: const PosStyles(
  //       align: PosAlign.center,
  //       fontType: PosFontType.fontA,
  //       height: PosTextSize.size1,
  //       width: PosTextSize.size1,
  //     ),
  //   );
  //   bytes += generator.cut();

  //   await PrintBluetoothThermal.writeBytes(bytes);
  // }

  Future<List<int>> printQRTable(
      url, label, number, reprint, Generator generator) async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    final outletName = await localStorage.getOutletName();

    List<int> bytes = [];

    bytes += generator.reset();

    if (!reprint) {
      bytes += generator.row([
        PosColumn(
          text: "",
          width: 1,
          styles: const PosStyles(
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: "Reprint",
          width: 10,
          styles: const PosStyles(
            align: PosAlign.center,
          ),
        ),
        PosColumn(
          text: "",
          width: 1,
          styles: const PosStyles(
            align: PosAlign.right,
          ),
        ),
      ]);
    }

    bytes += generator.row([
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: outletName,
        width: 10,
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      ),
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: '$date $tdata',
        width: 10,
        styles: const PosStyles(
          align: PosAlign.center,
        ),
      ),
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.row([
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.left,
        ),
      ),
      PosColumn(
        text: 'Table : $label',
        width: 10,
        styles: const PosStyles(
          bold: true,
          align: PosAlign.center,
        ),
      ),
      PosColumn(
        text: "",
        width: 1,
        styles: const PosStyles(
          align: PosAlign.right,
        ),
      ),
    ]);
    bytes += generator.hr();
    bytes += generator.feed(1);
    bytes += generator.qrcode(
      url,
      size: QRSize.Size8,
      align: PosAlign.center,
    );
    bytes += generator.feed(1);
    bytes += generator.text(
      'Scan QR Code untuk pesan.',
      styles: const PosStyles(
        align: PosAlign.center,
        fontType: PosFontType.fontA,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
      ),
    );
    bytes += generator.cut();

    return bytes;
  }
}
