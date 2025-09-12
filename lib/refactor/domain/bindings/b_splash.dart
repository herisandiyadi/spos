import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/c_initial.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_header.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // :: Controller
    Get.lazyPut<SMenuRepository>(() =>
        SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));

    Get.lazyPut<InitialController>(
        () => InitialController(Get.find<LocalStorage>()));
    Get.lazyPut<TransactionOrderSMController>(
        () => TransactionOrderSMController(
            Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(),
            Get.find<TransactionDetailSMController>()),
        fenix: true);
    Get.lazyPut<TransactionDetailSMController>(
        () => TransactionDetailSMController(Get.find<SMenuRepository>()),
        fenix: true);

    Get.lazyPut<TransactionHeaderSMController>(
        () => TransactionHeaderSMController(Get.find<SMenuRepository>()),
        fenix: true);
  }
}
