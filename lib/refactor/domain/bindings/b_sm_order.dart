import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/reserve/c_reserve_offline.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_detail.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_order.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/request/c_create_transaction_sm.dart';

class SMOrderBinding extends Bindings {
  @override
  void dependencies() {
    // :: Repositories
    Get.lazyPut<SMenuRepository>(() =>
        SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));

    // :: Controllers
    Get.lazyPut<ReserveOfflineController>(() => ReserveOfflineController());
    Get.lazyPut<TransactionDetailSMController>(
        () => TransactionDetailSMController(Get.find<SMenuRepository>()));
    Get.lazyPut<TransactionOrderSMController>(() =>
        TransactionOrderSMController(
            Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(),
            Get.find<TransactionDetailSMController>()));
    Get.lazyPut<CreateTransactionSMController>(() =>
        CreateTransactionSMController(Get.find<LocalStorage>(),
            Get.find<SMenuRepository>(), Get.find<ReserveOfflineController>()));
  }
}
