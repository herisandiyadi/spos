import 'package:get/get.dart';
import 'package:squadra_pos/refactor/data/providers/contract.dart';
import 'package:squadra_pos/refactor/data/resources/local_storage.dart';
import 'package:squadra_pos/refactor/data/respositories_impl/auth/impl_auth.dart';
import 'package:squadra_pos/refactor/domain/repositories/auth/r_auth.dart';
import 'package:squadra_pos/refactor/presentation/controllers/auth/c_sign_in.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {    
    // :: Repositories
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<Network>(), Get.find<LocalStorage>()));

    // :: Controllerss
    Get.lazyPut<SignInController>(() => SignInController(Get.find<AuthRepository>(), Get.find<LocalStorage>()));
  }
}