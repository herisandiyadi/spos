import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/c_printer.dart';

class BluetoothController extends GetxController {
  BluetoothController(this._localStorage, this._printerController);

  final LocalStorage _localStorage;
  final PrinterController _printerController;

  final bluetoothList = <BluetoothInfo>[].obs;

  final bluetoothEnabled = false.obs;
  final porcentBattery = 0.obs;
  final platformVersion = ''.obs;
  final connectedPrinter = ''.obs;
  final information = ''.obs;

  var status = RxStatus.empty().obs;

  Future<bool> _checkAllBluetoothPermissions() async {
    final connect = await Permission.bluetoothConnect.request();
    final scan = await Permission.bluetoothScan.request();
    final location = await Permission.location.request();

    if (!connect.isGranted || !scan.isGranted || !location.isGranted) {
      status.value = RxStatus.error("Bluetooth permissions denied.");
      return false;
    }

    final thermalGranted =
        await PrintBluetoothThermal.isPermissionBluetoothGranted;
    if (!thermalGranted) {
      status.value =
          RxStatus.error("Bluetooth printer permission not granted.");
      return false;
    }

    return true;
  }

  Future<void> _getPairedDevices() async {
    try {
      final result = await PrintBluetoothThermal.pairedBluetooths;
      print(result);
      bluetoothList.assignAll(result);

      status.value = RxStatus.success();
    } catch (_) {
      status.value = RxStatus.error("Failed fetch paired bluetooths");
    }
  }

  Future<void> _loadDeviceInfo() async {
    try {
      platformVersion.value = await PrintBluetoothThermal.platformVersion;
      porcentBattery.value = await PrintBluetoothThermal.batteryLevel;
    } catch (_) {
      platformVersion.value = 'Failed to get platform version.';
      status.value = RxStatus.error("Failed to retrieve device information.");
    }
  }

  Future<void> initPrinterBluetooths() async {
    status.value = RxStatus.loading();
    information.value = "Checking bluetooth connection...";

    final permissionsGranted = await _checkAllBluetoothPermissions();
    if (!permissionsGranted) return;

    try {
      final connect = await _localStorage.getBluetoothPrinter();
      print(connect);
      if (connect.isNotEmpty) {
        connectedPrinter.value = connect;
      }

      await _loadDeviceInfo();

      bluetoothEnabled.value = await PrintBluetoothThermal.bluetoothEnabled;

      if (bluetoothEnabled.value) {
        await _getPairedDevices();
      } else {
        status.value =
            RxStatus.error("Bluetooth is not enabled on the device.");
      }
    } catch (_) {
      status.value = RxStatus.error("Initialization failed.");
    }
  }

  Future<void> connectPrinter({required String macAddress}) async {
    try {
      status.value = RxStatus.loading();
      information.value = 'Connecting to devices...';

      await Future.delayed(const Duration(seconds: 1));

      if (await PrintBluetoothThermal.connectionStatus)
        await disconnectPrinter();

      final connected =
          await PrintBluetoothThermal.connect(macPrinterAddress: macAddress);

      if (connected) {
        connectedPrinter.value = macAddress;
        await _localStorage.saveBluetoothPrinter(macAddress);
        await _localStorage
            .savePrimaryPrinter(["BluetoothPrinter", macAddress]);

        await _printerController.checkPrinterConnected();

        status.value = RxStatus.success();
      } else {
        status.value = RxStatus.error(
            "Connection failed.\nEnsure printer is powered on and Bluetooth is enabled.");
      }
    } catch (_) {
      status.value = RxStatus.error("Error connecting to printer.");
    }
  }

  Future<void> disconnectPrinter() async {
    try {
      if (await PrintBluetoothThermal.connectionStatus) {
        final statusDisconnect = await PrintBluetoothThermal.disconnect;

        if (statusDisconnect) {
          connectedPrinter.value = '';
          await _localStorage.removeBluetoothPrinter();
          await _localStorage.removePrimaryPrinter();

          await _printerController.checkPrinterConnected();

          status.value = RxStatus.success();
        } else {
          status.value = RxStatus.error("Failed to disconnect from printer.");
        }
      }
    } catch (_) {
      status.value = RxStatus.error("Error while disconnecting printer.");
    }
  }

  void testPrint() async {
    bool connected = await PrintBluetoothThermal.connectionStatus;

    if (!connected) return;

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    List<int> bytes = [];

    final ByteData data = await rootBundle.load('assets/images/logoText.png');
    final Uint8List imageBytes = data.buffer.asUint8List();
    // final img.Image? image = img.decodeImage(imageBytes);

    // if (image != null) {
    //   final resizedImage = img.copyResize(image, width: 200);
    //   bytes += generator.image(resizedImage, align: PosAlign.center);
    // }

    bytes += generator.text(
      "SQUADRA POS",
      linesAfter: 1,
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );

    bytes += generator.row([
      PosColumn(
        text: 'TEST PRINT',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(
        text: 'TEST PRINT',
        width: 6,
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);

    bytes += generator.text("TEST PRINT",
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.feed(1);
    bytes += generator.cut();

    await PrintBluetoothThermal.writeBytes(bytes);
  }
}
