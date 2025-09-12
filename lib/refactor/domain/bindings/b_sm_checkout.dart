import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/smenu/impl_smenu.dart';
import 'package:squadra_pos/refactor/domain/repositories/transactions/smenu/r_smenu.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/smenu/c_transaction_sm_check_out.dart';

class SMCheckOutBinding extends Bindings {
  @override
  void dependencies() {    
    // :: Repositories
    Get.lazyPut<SMenuRepository>(() => SMenuRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));

    // :: Controllers
    Get.lazyPut<TransactionCheckOutSMController>(() => TransactionCheckOutSMController(Get.find<SMenuRepository>(), Get.find<LocalStorage>()));
  }
}