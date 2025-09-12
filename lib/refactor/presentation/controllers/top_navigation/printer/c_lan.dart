import 'dart:io';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:squadra_pos/database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';

class LanController extends GetxController {
  LanController(this._localStorage);

  final LocalStorage _localStorage;
  final _dbHelper = DatabaseHelper();

  final ipList = <String>[].obs;
  final information = ''.obs;
  final connectedPrinter = ''.obs;
  final status = RxStatus.empty().obs;

  final selectedPrinters = <int, String?>{}.obs;
  final stations = <StationLiteModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // getPrinterIPDevices();
  }

  @override
  void onReady() {
    super.onReady();
    refreshPrinters();
  }

  // Future<void> refreshPrinters() async {
  //   status.value = RxStatus.loading();
  //   await getPrinterIPDevices();
  //   await _loadStations(preserveSelected: true);
  //   status.value = ipList.isNotEmpty
  //       ? RxStatus.success()
  //       : RxStatus.error("No printers detected on the local network.");
  // }

  void updateSelectedPrinter(
      {required int index,
      required String stationName,
      required String? value}) async {
    selectedPrinters[index] = value;
    selectedPrinters.refresh();

    if (value == null) {
      await _localStorage.removeStationName(stationName);
    } else {
      await _localStorage.saveStationName(stationName, value);
    }
  }

  // Future<void> getPrinterIPDevices() async {
  //   status.value = RxStatus.loading();
  //   information.value = "Checking Network Printer...";

  //   await _loadConnectedPrinter();
  //   final ipPrefix = await _getLocalIpPrefix();

  //   if (ipPrefix.isEmpty) {
  //     status.value = RxStatus.error("Failed to get local IP address.");
  //     return;
  //   }

  //   bool found = await _scanNetworkPrinters(ipPrefix); // return true/false

  //   if (!found) {
  //     ipList.clear(); // kosongkan kalau tidak ada yang ketemu
  //   }
  //   await _loadStations();
  // }

  Future<void> _loadConnectedPrinter() async {
    final primaryPrinter = await _localStorage.getPrimaryPrinter();

    if (primaryPrinter.isNotEmpty && primaryPrinter.first == 'LanPrinter') {
      connectedPrinter.value = primaryPrinter[1];
    }
  }

  Future<String> _getLocalIpPrefix() async {
    for (final interface in await NetworkInterface.list()) {
      for (final addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          final parts = addr.address.split('.');

          return '${parts[0]}.${parts[1]}.${parts[2]}';
        }
      }
    }

    return '';
  }

  // Future<bool> _scanNetworkPrinters(String ipPrefix) async {
  //   // ipList.clear();

  //   const port = 9100;
  //   const concurrency = 20;
  //   final ips = List.generate(254, (i) => '$ipPrefix.${i + 1}');

  //   bool found = false;

  //   List<String> newFoundIPs = [];
  //   for (int i = 0; i < ips.length; i += concurrency) {
  //     final batch = ips.skip(i).take(concurrency);

  //     await Future.wait(batch.map((ip) async {
  //       try {
  //         final socket = await Socket.connect(ip, port,
  //             timeout: const Duration(milliseconds: 500));
  //         socket.destroy();

  //         if (!ipList.contains(ip)) {
  //           newFoundIPs.insert(0, ip);
  //         }
  //         found = true;
  //       } catch (_) {}
  //     }));
  //   }

  //   if (found) {
  //     ipList.insertAll(0, newFoundIPs);
  //   }
  //   debugPrint('Scan finished. Found $found devices.');
  //   return found;
  // }

  Future<void> setAsPrimaryPrinter(String ip) async {
    await _localStorage.removeBluetoothPrinter();
    await _localStorage.savePrimaryPrinter(["LanPrinter", ip]);

    connectedPrinter.value = ip;
  }

  // Future<void> _loadStations() async {
  //   final stationData = await _dbHelper.getStation();

  //   stations
  //       .assignAll(stationData.map((json) => StationLiteModel.fromJson(json)));

  //   bool hasPrinter = false;

  //   for (int i = 0; i < stations.length; i++) {
  //     final printerIp =
  //         await _localStorage.getStationName(stations[i].stationName);

  //     if (printerIp.isNotEmpty && ipList.contains(printerIp)) {
  //       final exists = ipList.contains(printerIp);

  //       selectedPrinters[i] =
  //           exists || printerIp == 'to Primary' ? printerIp : null;

  //       hasPrinter = true;
  //     } else {
  //       selectedPrinters[i] = null;
  //     }
  //   }

  //   status.value = hasPrinter
  //       ? RxStatus.success()
  //       : RxStatus.error("No printers detected on the local network.");
  // }
  // Future<void> _loadStations({bool preserveSelected = false}) async {
  //   final stationData = await _dbHelper.getStation();
  //   stations
  //       .assignAll(stationData.map((json) => StationLiteModel.fromJson(json)));

  //   bool hasPrinter = false;

  //   for (int i = 0; i < stations.length; i++) {
  //     final printerIp =
  //         await _localStorage.getStationName(stations[i].stationName);

  //     if (printerIp.isNotEmpty) {
  //       // kalau preserveSelected true, tetap simpan walau ip tidak ditemukan
  //       final exists = ipList.contains(printerIp);
  //       if (exists || preserveSelected) {
  //         selectedPrinters[i] = printerIp;
  //         hasPrinter = true;
  //       } else {
  //         selectedPrinters[i] = null; // reset hanya jika tidak preserve
  //       }
  //     } else {
  //       selectedPrinters[i] = null;
  //     }
  //   }

  //   if (!preserveSelected) {
  //     status.value = hasPrinter
  //         ? RxStatus.success()
  //         : RxStatus.error("No printers detected on the local network.");
  //   }
  // }

  Future<void> refreshPrinters() async {
    status.value = RxStatus.loading();
    await getPrinterIPDevices();
    await _loadStations(
        preserveSelected: false); // sekarang hanya load yang valid
    status.value = ipList.isNotEmpty
        ? RxStatus.success()
        : RxStatus.error("No printers detected on the local network.");
  }

  Future<void> getPrinterIPDevices() async {
    status.value = RxStatus.loading();
    information.value = "Checking Network Printer...";

    await _loadConnectedPrinter();
    final ipPrefix = await _getLocalIpPrefix();

    if (ipPrefix.isEmpty) {
      status.value = RxStatus.error("Failed to get local IP address.");
      return;
    }

    final found = await _scanNetworkPrinters(ipPrefix);
    if (!found) {
      ipList.clear(); // kosongkan supaya combobox ikut kosong
    }
  }

  Future<bool> _scanNetworkPrinters(String ipPrefix) async {
    const port = 9100;
    const concurrency = 20;
    final ips = List.generate(254, (i) => '$ipPrefix.${i + 1}');

    List<String> newIPs = [];
    bool found = false;

    for (int i = 0; i < ips.length; i += concurrency) {
      final batch = ips.skip(i).take(concurrency);

      await Future.wait(batch.map((ip) async {
        try {
          final socket = await Socket.connect(ip, port,
              timeout: const Duration(milliseconds: 500));
          socket.destroy();
          newIPs.add(ip);
          found = true;
        } catch (_) {}
      }));
    }

    ipList.assignAll(newIPs); // replace dengan hasil terbaru
    debugPrint('Scan finished. Found $found devices.');
    return found;
  }

  Future<void> _loadStations({bool preserveSelected = false}) async {
    final stationData = await _dbHelper.getStation();
    stations
        .assignAll(stationData.map((json) => StationLiteModel.fromJson(json)));

    bool hasPrinter = false;

    for (int i = 0; i < stations.length; i++) {
      final printerIp =
          await _localStorage.getStationName(stations[i].stationName);

      // hanya assign kalau printer masih ada di ipList
      if (printerIp.isNotEmpty && ipList.contains(printerIp)) {
        selectedPrinters[i] = printerIp;
        hasPrinter = true;
      } else {
        selectedPrinters[i] = null;
        // bisa juga langsung hapus dari storage supaya tidak muncul lagi
        await _localStorage.removeStationName(stations[i].stationName);
      }
    }

    status.value = hasPrinter
        ? RxStatus.success()
        : RxStatus.error("No printers detected on the local network.");
  }

  Future<void> connectAndTestPrint(String printerIP) async {
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(PaperSize.mm80, profile);

    final result = await printer.connect(printerIP, port: 9100);

    if (result == PosPrintResult.success) {
      final data = await rootBundle.load('assets/images/logoText.png');
      final bytes = data.buffer.asUint8List();
      // final image = img.decodeImage(bytes);

      // if (image == null) return;

      // printer.image(image);
      printer.text('SQUADRA POS', styles: const PosStyles(bold: true));
      printer.feed(2);
      printer.text('TEST PRINT',
          styles: const PosStyles(align: PosAlign.center));
      printer.feed(2);
      printer.text(
        'TEST PRINT',
        styles: const PosStyles(
            height: PosTextSize.size2, width: PosTextSize.size2),
      );
      printer.feed(1);
      printer.cut();

      printer.disconnect();
    } else {
      status.value =
          RxStatus.error("Failed to connect to printer at $printerIP");
    }
  }
}
