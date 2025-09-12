import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_bill_offline.dart';

class OfflineOrderBinding extends Bindings {
  @override
  void dependencies() {    
    // :: Repositories
   
    // :: Controllers
    Get.lazyPut<OrderOfflineController>(() => OrderOfflineController());
    Get.lazyPut<PrintBillOfflineController>(() => PrintBillOfflineController(Get.find<LocalStorage>()));
  }
}