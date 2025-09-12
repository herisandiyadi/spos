import 'package:get/get.dart';
import 'package:squadra_pos/database/database_helper.dart';

class AutoPrintController extends GetxController {
  final RxBool isAutoPrint = false.obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadAutoPrint();
  }

  Future<void> loadAutoPrint() async {
    final value = await _dbHelper.getAutoPrint();
    isAutoPrint.value = value;
  }

  Future<void> setAutoPrint(bool value) async {
    isAutoPrint.value = value;
    await _dbHelper.setAutoPrint(value);
  }
}
