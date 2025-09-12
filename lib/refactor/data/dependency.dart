import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/providers/http/http_contract.dart';
import 'package:squadra_pos/refactor/data/providers/http/http_implementation.dart';
import 'package:squadra_pos/refactor/data/providers/implementation.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/impl_send_data.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/r_send_data.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_auto_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_screen_lock.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_out.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_order_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/c_print_receipt_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';

import 'package:squadra_pos/refactor/presentation/controllers/internet_controller.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auto_print_controller.dart';

class Dependency extends GetxService {
  static Future<void> init() async {
    // :: Local Storage
    Get.put<LocalStorage>(LocalStorage(), permanent: true);
    // :: Network Initialization
    Get.lazyPut<HttpNetwork>(() => HttpNetworkImplementation(), fenix: true);
    Get.lazyPut<Network>(() => NetworkImplementation(Get.find<HttpNetwork>()),
        fenix: true);
    Get.lazyPut<SMenuRepository>(
        () =>
            SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()),
        fenix: true);

    Get.lazyPut<PrintReceiptOfflineController>(
        () => PrintReceiptOfflineController(Get.find<LocalStorage>()));
    Get.lazyPut<SignOutController>(
        () => SignOutController(Get.find<LocalStorage>()));
    Get.lazyPut<ScreenLockController>(() => ScreenLockController(
        Get.find<LocalStorage>(), Get.find<SignOutController>()));
    Get.put<AutoLockController>(
        AutoLockController(Get.find<ScreenLockController>()),
        permanent: true);
    Get.lazyPut<OrderOfflineController>(() => OrderOfflineController(),
        fenix: true);
    Get.lazyPut<TransactionOrderSMController>(
        () => TransactionOrderSMController(
            Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(),
            Get.find<TransactionDetailSMController>()),
        fenix: true);
    Get.lazyPut<TransactionDetailSMController>(
        () => TransactionDetailSMController(Get.find<SMenuRepository>()),
        fenix: true);
    Get.lazyPut<SendDataRepository>(
        () => SendDataRepositoryImpl(
            Get.find<Network>(), Get.find<LocalStorage>()),
        fenix: true);

    Get.lazyPut<TransactionHeaderSMController>(
        () => TransactionHeaderSMController(Get.find<SMenuRepository>()),
        fenix: true);

    // :: Internet Controller (for online/offline status)
    Get.put<InternetController>(InternetController(), permanent: true);

    // :: Auto Print Controller (for auto print toggle)
    Get.put<AutoPrintController>(AutoPrintController(), permanent: true);
  }
}
