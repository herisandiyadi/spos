import 'package:get/get.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';

class PrinterController extends GetxController {
  PrinterController(this._localStorage);

  final LocalStorage _localStorage;
  
  RxString label = 'Not Connected to Any Primary Printer'.obs;

  Future<void> checkPrinterConnected() async {
    final primaryPrinter = await _localStorage.getPrimaryPrinter();
    final connectedBluetoothPrinter = await _localStorage.getBluetoothPrinter();
    
    bool connected = await PrintBluetoothThermal.connectionStatus;

    if (!connected && connectedBluetoothPrinter.isNotEmpty) {
      final bool response = await PrintBluetoothThermal.connect(macPrinterAddress: connectedBluetoothPrinter);

      if (!response) await _localStorage.removeBluetoothPrinter();
    } 
    
    if (connected && connectedBluetoothPrinter.isEmpty) {
      await _localStorage.savePrimaryPrinter(["", ""]);
    }

    if (primaryPrinter.first.isNotEmpty) {
      label.value = "Primary Printer Connected to ${primaryPrinter.first} : ${primaryPrinter.last}";
    } else {
      label.value = "Not Connected to Any Primary Printer";
    }
  }

  @override
  void onInit() {
    super.onInit();

    checkPrinterConnected();
  }
}