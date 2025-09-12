import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_check_out_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_bill_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_receipt_offline.dart';

class OfflineCheckOutBinding extends Bindings {
  @override
  void dependencies() {
    // :: Repositories

    // :: Controllers
    Get.lazyPut<OrderOfflineController>(() => OrderOfflineController());
    Get.lazyPut<CheckOutOfflineController>(
        () => CheckOutOfflineController(Get.find<LocalStorage>()));
    Get.lazyPut<PrintBillOfflineController>(
        () => PrintBillOfflineController(Get.find<LocalStorage>()));
    Get.lazyPut<PrintReceiptOfflineController>(
        () => PrintReceiptOfflineController(Get.find<LocalStorage>()));
  }
}
